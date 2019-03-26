{###############################################################################
# test-attributes.R
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
context("attributes")
test_that("noattr", {
    a <- structure(1, name="hello")
    expect_identical(noattr(a), 1)
    
    l <- list(a=a, b=structure(2, name = "Hola"))
    expect_identical(noattr(l), list(1,2))
})

test_that("getAttr", {
    a <- structure(1, name="hello")

    expect_equal(getAttr(a, 'name'), "hello")
    expect_equal(getAttr(a, 'name', "john"), "hello")
    expect_null(getAttr(a, 'class'))
    expect_equal(getAttr(a, 'class', 'abc'), "abc")
    
})


