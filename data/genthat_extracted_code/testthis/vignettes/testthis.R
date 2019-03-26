## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)

library(testthis)
library(rstudioapi)

## ----eval = FALSE--------------------------------------------------------
#  # file R/open_testfile.R
#  
#  #* @testfile other_testfile
#  open_testfile <- function(){
#    fname <- get_testfile_name()
#  
#    if(file.exists(fname)){
#      rstudioapi::navigateToFile(fname)
#    } else {
#      test_skeleton(fname, open = TRUE)
#    }
#  }

## ---- eval = FALSE-------------------------------------------------------
#  use_testdata(iris)
#  ## Saving to
#  ## * r/testthis/tests/testthat/testdata/iris.rds
#  
#  tdat <- read_testdata("iris.rds")
#  
#  use_testdata_raw()
#  ## ✔ Creating 'tests/testthat/testdata-raw/'

## ---- eval = FALSE-------------------------------------------------------
#  use_test_subdir("foobar_tests")
#  ## ✔ Creating 'tests/testthat/foobar_tests/'
#  ## creating tester function test_foobar_tests() in r/testthis/R/testthis-testers.R
#  
#  test_subdir("foobar_tests")
#  ## No tests: no files in r/testthis/tests/testthat/foobar_tests match '^test.*\.[rR]$'

## ---- eval = FALSE-------------------------------------------------------
#  # file /tests/testhis/parse_testthis_comments.R
#  
#  test_that("parse_testthis_comments works as expected", {
#    #* @testing detect_testthis_comments
#    ...
#  }

## ---- eval = FALSE-------------------------------------------------------
#  get_test_coverage()

