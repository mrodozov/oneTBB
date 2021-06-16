# Copyright (c) 2020-2021 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set(TBB_COMPILER_SETTINGS_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/compilers/${CMAKE_CXX_COMPILER_ID}.cmake)
if (EXISTS ${TBB_COMPILER_SETTINGS_FILE})
    include(${TBB_COMPILER_SETTINGS_FILE})
else()
    message(WARNING "TBB compiler settings not found ${TBB_COMPILER_SETTINGS_FILE}")
endif()

# Enabling LTO
set(TBB_COMMON_COMPILE_FLAGS ${TBB_COMMON_COMPILE_FLAGS} $<$<NOT:$<CONFIG:Debug>>:${TBB_IPO_COMPILE_FLAG}>)
set(TBB_COMMON_LINK_FLAGS
    ${TBB_COMMON_LINK_FLAGS}
    $<$<NOT:$<CONFIG:Debug>>:${TBB_IPO_LINK_FLAG} $<$<PLATFORM_ID:Windows>:/INCREMENTAL:NO>>
)
