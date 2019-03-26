## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  install_scipy <- function(method = "auto", conda = "auto") {
#    reticulate::py_install("scipy", method = method, conda = conda)
#  }

## ------------------------------------------------------------------------
#  # python 'scipy' module I want to use in my package
#  scipy <- NULL
#  
#  .onLoad <- function(libname, pkgname) {
#    # delay load foo module (will only be loaded when accessed via $)
#    scipy <<- import("scipy", delay_load = TRUE)
#  }

## ------------------------------------------------------------------------
#  # helper function to skip tests if we don't have the 'foo' module
#  skip_if_no_scipy <- function() {
#    have_scipy <- py_module_available("scipy")
#    if (!have_scipy)
#      skip("scipy not available for testing")
#  }
#  
#  # then call this function from all of your tests
#  test_that("Things work as expected", {
#    skip_if_no_scipy()
#    # test code here...
#  })

## ------------------------------------------------------------------------
#  method.MyModule.MyPythonClass <- function(x, y, ...) {
#    if (py_is_null_xptr(x))
#      # whatever is appropriate
#    else
#      # interact with the object
#  }

## ------------------------------------------------------------------------
#  #' @importFrom reticulate py_str
#  #' @export
#  py_str.MyModule.MyPythonClass <- function(object, ...) {
#    # interact with the object to generate the string
#  }

