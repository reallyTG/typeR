#############################################################################
##
## Copyright 2016 Novartis Institutes for BioMedical Research Inc.
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
#############################################################################

context("H5I")

test_that("Interface functions in H5RefClass", {
    ## create a datatype, check that it is a datatype
    ## get the ref_count, increase it, decrease it, return
    dtype_int32 <- h5types$H5T_NATIVE_INT
    expect_equal(as.character(dtype_int32$get_obj_type()), "H5I_DATATYPE")
    expect_equal(dtype_int32$get_ref(), 1)
    dtype_int32$inc_ref()
    expect_equal(dtype_int32$get_ref(), 2)
    dtype_int32$dec_ref()
    expect_equal(dtype_int32$get_ref(), 1)
})

          
