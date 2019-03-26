{###############################################################################
# test-defaults.R
# This file is part of the R package harvestr.
# 
# Copyright 2012 Andrew Redd
# Date: 6/2/2012
# 
# DESCRIPTION
# ===========
# test the caching facilities.
# 
# LICENSE
# ========
# harvestr is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software 
# Foundation, either version 3 of the License, or (at your option) any later 
# version.
# 
# dostats is distributed in the hope that it will be useful, but WITHOUT ANY 
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with 
# dostats. If not, see http://www.gnu.org/licenses/.
# 
}###############################################################################
library(harvestr)
library(testthat)
context("defaults")

test_that("is_top_harvestr_call", {
#~     expect_false(is_top_harvestr_call())
#~     expect_true (test_is_top_harvestr_call())
#~     expect_false(test_is_top_harvestr_call(1))
})
test_that("parallel", {
#~     expect_error( dflt_harvestr_parallel()
#~                 , "dflt_harvestr_parallel should not be called directly."
#~                 , "called not from another call should")
    
#~     foreach::registerDoSEQ()
#~     expect_equal( test_dflt_harvestr_parallel(), TRUE
#~                 , info="Top call should be equal to getDoParRegistered")
#~     expect_equal(test_dflt_harvestr_parallel(1), 0
#~                 , info="not the top call.")
    expect_equal(test_dflt_harvestr_parallel(2, nest=1), 1
                , info="nested with more parallel than nesting")
    expect_equal(test_dflt_harvestr_parallel(1, nest=2), 0
                , info="nested with more nesting than parallel")
})
test_that("progress", {
    expect_equal(test_dflt_harvestr_progress(TRUE , 'windows', is.top.call=TRUE), 'win')
    expect_equal(test_dflt_harvestr_progress(TRUE , 'unix'   , is.top.call=TRUE), 'time')
    expect_equal(test_dflt_harvestr_progress(FALSE, 'windows', is.top.call=TRUE), 'none')
    expect_equal(test_dflt_harvestr_progress(FALSE, 'unix'   , is.top.call=TRUE), 'none')
})
test_that("others", {
    expect_false(dflt_harvestr_time())
    expect_false(dflt_harvestr_cache())
    expect_equal(dflt_harvestr_cache_dir(), "harvestr-cache")
    expect_equal(dflt_harvestr_use_try(), !interactive())
})


