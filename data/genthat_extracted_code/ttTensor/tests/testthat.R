library("testthat")
library("ttTensor")
library("rTensor")
library("tensorr")
library("Matrix")

options(testthat.use_colours = FALSE)

test_file("testthat/test_TTSVD.R")
test_file("testthat/test_TTWOPT.R")
test_file("testthat/test_skeleton.decomp.R")
test_file("testthat/test_TTCross.R")
