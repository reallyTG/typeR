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

context("H5L")

test_that("Link functions", {
    test_file <- tempfile(fileext=".h5")
    ## open a new one, truncate if it exists
    file.h5 <- H5File$new(test_file, mode="w")
    test1 <- file.h5$create_group("test1")

    ## now create a soft link and an external link
    file.h5$link_create_hard(file.h5, "test1", "test_hard")
    file.h5$link_create_soft("test1", "test_soft")
    file.h5$link_create_external("testfile", "test", "test_external")

    ## check that link exist
    expect_true(file.h5$link_exists("test_hard"))

    ## get the names by index
    num_links <- file.h5$group_info()$nlinks
    expect_equal(num_links, 4)
    expect_equal(file.h5$link_name_by_idx(0, ".", order=h5const$H5_ITER_INC), "test1")
    expect_equal(file.h5$link_name_by_idx(1, ".", order=h5const$H5_ITER_INC), "test_external")
    expect_equal(file.h5$link_name_by_idx(2, ".", order=h5const$H5_ITER_INC), "test_hard")
    expect_equal(file.h5$link_name_by_idx(3, ".", order=h5const$H5_ITER_INC), "test_soft")
    
    ## check info directly and by index
    info_hard <- file.h5$link_info("test_hard")
    info_soft <- file.h5$link_info("test_soft")
    info_external <- file.h5$link_info("test_external")

    info_hard_idx <- file.h5$link_info_by_idx(2, ".", order=h5const$H5_ITER_INC)
    info_soft_idx <- file.h5$link_info_by_idx(3, ".", order=h5const$H5_ITER_INC)
    info_external_idx <- file.h5$link_info_by_idx(1, ".", order=h5const$H5_ITER_INC)

    expect_equal(info_hard, info_hard_idx)
    expect_equal(info_soft, info_soft_idx)
    expect_equal(info_external, info_external_idx)

    ## get the link values
    expect_equal(file.h5$link_value("test_hard"), NA)
    expect_equal(file.h5$link_value("test_soft"), "test1")
    expect_equal(file.h5$link_value("test_external"), list(file_name="testfile", obj_name="test"))

    ## now the same link values by index
    expect_equal(file.h5$link_value_by_idx(2, ".", order=h5const$H5_ITER_INC), NA)
    expect_equal(file.h5$link_value_by_idx(3, ".", order=h5const$H5_ITER_INC), "test1")
    expect_equal(file.h5$link_value_by_idx(1, ".", order=h5const$H5_ITER_INC), list(file_name="testfile", obj_name="test"))

    ## now move a link
    file.h5$link_move_from(file.h5, "test1", "test_move")
    expect_true(file.h5$link_exists("test_move"))
    expect_true(!file.h5$link_exists("test1"))
    file.h5$link_move_to(file.h5, "test1", "test_move")
    expect_true(!file.h5$link_exists("test_move"))
    expect_true(file.h5$link_exists("test1"))

    ## copy a link
    file.h5$link_copy_from(file.h5, "test1", "test_copy_1")
    expect_true(file.h5$link_exists("test_copy_1"))
    file.h5$link_copy_to(file.h5, "test_copy_2", "test_copy_1")
    expect_true(file.h5$link_exists("test_copy_2"))
    
    ## delete a link, directly and by index
    file.h5$link_delete("test_copy_2")
    expect_true(!file.h5$link_exists("test_copy_2"))
    file.h5$link_delete_by_idx(0, ".", order=h5const$H5_ITER_INC)
    expect_true(!file.h5$link_exists("test1"))
    
    
    file.h5$close_all()
    file.remove(test_file)
    
})
