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

context("H5S")

test_that("Setting different types of dataspaces", {
    ds_simple <- H5S$new(type="simple")
    ds_scalar <- H5S$new(type="scalar")
    ds_null <- H5S$new(type="null")

    ## check that the types are as expected
    expect_true(ds_simple$get_select_type() == "H5S_SEL_ALL")
    expect_equal(ds_simple$get_simple_extent_type(), h5const$H5S_SIMPLE)
    expect_equal(ds_scalar$get_simple_extent_type(), h5const$H5S_SCALAR)
    expect_equal(ds_null$get_simple_extent_type(), h5const$H5S_NULL)
})

test_that("Setting extensions of dataspace", {
    ## create one with extent set immediately
    ## then one where the extent is set after creation
    ds_extent_new <- H5S$new(dims=as.double(c(4,6,3,4)), maxdims=c(Inf, 6, Inf, 8))
    ds_extent_later <- H5S$new(type="simple")
    ds_extent_later$set_extent_simple(dims=c(4,6,3,4), maxdims=c(Inf, 6, Inf, 8))
    expect_true(ds_extent_new$extent_equal(ds_extent_later))
})

test_that("Retrieving dimensions", {
    ds_simple <- H5S$new(type="simple", dims=c(10,20), maxdims=c(Inf, 30))
    ds_scalar <- H5S$new(type="scalar")
    ds_null <- H5S$new(type="null")

    expect_equal(ds_null$dims, NULL)
    expect_equal(ds_null$maxdims, NULL)
    expect_equal(ds_scalar$dims, integer(0))
    expect_equal(ds_scalar$maxdims, integer(0))
    expect_equal(ds_simple$dims, c(10,20))
    expect_equal(ds_simple$maxdims, c(Inf, 30))
    
})


test_that("Setting and retrieving hyperslabs", {
    ## create a simple DS, select two hyperslabs, overlapping, with AND and OR
    ds_simple <- H5S$new(type="simple", dims=c(10,10,40), maxdims=c(Inf, Inf, Inf))
    ds_simple$select_hyperslab(start=c(2,3,2), count=c(2,1,1), block=c(2,3,2), stride=c(3,5,3), op=h5const$H5S_SELECT_SET)
    blocks <- ds_simple$get_select_hyper_nblocks()
    blocklist <- ds_simple$get_select_hyper_blocklist()
    ## now check that the blocklist is as expected
    expect_equal(blocks, 2)
    expect_equal(blocklist, structure(matrix(c(2,3,2, 3, 5, 3, 5, 3, 2, 6, 5, 3), ncol=3, byrow=TRUE),
                                      dimnames=list(c("block_1_start", "block_1_end", "block_2_start", "block_2_end"), NULL)))

    
})

test_that("Testing encode/decode as well as copy", {
    ## create a new dataspace, , encode it, then decode it again, then compare
    ## the old one to the new one
    ds_simple <- H5S$new(type="simple", dims=c(10,10,40), maxdims=c(Inf, Inf, Inf))
    ds_simple$select_hyperslab(start=c(2,3,2), count=c(2,1,1), block=c(2,3,2), stride=c(3,5,3), op=h5const$H5S_SELECT_SET)
    buf <- ds_simple$encode()
    ds_decode <- H5S$new(decode_buf=buf)
    ds_copy <- ds_simple$copy()
    
    ## now check that in various aspects, the new and the old dataspace are identical
    expect_equal(ds_simple$get_select_type(), ds_decode$get_select_type())
    expect_equal(ds_simple$get_select_hyper_blocklist(), ds_decode$get_select_hyper_blocklist())
    expect_equal(ds_simple$get_select_type(), ds_copy$get_select_type())
    expect_equal(ds_simple$get_select_hyper_blocklist(), ds_copy$get_select_hyper_blocklist())

    ## ds_simple$offset_simple(c(5,1,1))
    ## ds_simple$select_valid()
    ## ds_simple$offset_simple(c(6,1,1))
    ## ds_simple$select_valid()
})

test_that("Setting of individual points", {
    ds_simple <- H5S$new(type="simple", dims=c(12,10,40), maxdims=c(Inf, Inf, Inf))
    coords <- matrix(c(1:5, 2:6, 3:7), ncol=3)
    ds_simple$select_elements(coord=coords, byrow=TRUE)
    coords_selected <- ds_simple$get_select_elem_pointlist()

    expect_equal(coords, coords_selected)

    ## now add the selection using an AND statement
    ds_simple$select_elements(coord=c(2,3,4), op=h5const$H5S_SELECT_APPEND)
    coords_selected_2 <- ds_simple$get_select_elem_pointlist()
    expect_equal(rbind(coords, c(2,3,4)), coords_selected_2)

    ## ds_simple$offset_simple(c(9,1,1))
    ## ds_simple$get_select_bounds()
    ## ds_simple$select_valid()
    ## ds_simple$offset_simple(c(10,1,1))
    ## ds_simple$get_select_bounds()
    ## ds_simple$select_valid()
    ## ds_simple$offset_simple(c(11,1,1))
    ## ds_simple$get_select_bounds()
    ## ds_simple$select_valid()
    
    ## ds_simple <- H5S$new(type="simple", dims=c(5,10,20), maxdims=c(Inf, Inf, Inf))
    ## ds_simple$select_elements(coord=c(1,1,1), byrow=TRUE)
    ## ds_simple$select_valid()

    ## ds_simple$offset_simple(NULL)
    ## ds_simple$get_select_bounds()
    ## ds_simple$select_valid()
    ## ds_simple$offset_simple(c(4,0,0))
    ## ds_simple$get_select_bounds()
    ## ds_simple$select_valid()
    ## ds_simple$offset_simple(c(5,0,0))
    ## ds_simple$get_select_bounds()
    ## ds_simple$select_valid()
    ## ds_simple$offset_simple(c(6,0,0))
    ## ds_simple$get_select_bounds()
    ## ds_simple$select_valid()
    
})
