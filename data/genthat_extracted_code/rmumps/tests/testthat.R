library(testthat)
library(rmumps)
library(Matrix)
library(methods)
if (getRversion() >= "3.4.0") {
  library(slam)
}

test_check("rmumps")
