# test_optOrEnvVar.R
# Tests of name resolution search prioritization.
# Author: Vince Reuter
# Email: vpr9v@virginia.edu

context("optOrEnvVar")

test_that("NULL result when neither option nor env. var. is set", {
  for (n in sapply(1:10, getRandVarName)) {
    stopifnot(is.null(getOption(n)) && identical("", Sys.getenv(n)))  
    expect_true(is.null(optOrEnvVar(!!n)))
  }
})

test_that("Option is recovered", {
  for (n in sapply(1:10, getRandVarName)) {
    stopifnot(is.null(getOption(n)) && identical("", Sys.getenv(n)))  
    value = "dummy_test_value"
    opts = list(value)
    names(opts) = n
    options(opts)
    if (is.null(getOption(n))) stop("Failed to set option: ", n)
    expect_equal(optOrEnvVar(!!n), value)
    opts = list(NULL)
    names(opts) = n
    options(opts)
    stopifnot(is.null(getOption(n)))
  }
})

test_that("Environment variable is recovered", {
  checkClean = function(n) { 
    stopifnot(is.null(getOption(n)) && identical("", Sys.getenv(n))) } 
  for (n in sapply(1:10, getRandVarName)) {
    checkClean(n)
    value = "dummy_test_value"
    args = list(value)
    names(args) = n
    do.call(what = Sys.setenv, args = args)
    if (.isEmpty(Sys.getenv(n))) stop("Failed to set env var: ", n)
    expect_equal(optOrEnvVar(!!n), value)
    Sys.unsetenv(n)
    checkClean(n)
  }
})

test_that("Option trumps environment variable", {
  varnames = sapply(1:10, getRandVarName)
  optValues = sapply(1:10, getRandVarName)
  envVarValues = sapply(1:10, getRandVarName)
  checkClean = function(n) {
    stopifnot(is.null(getOption(n)) && identical("", Sys.getenv(n))) }
  for (i in 1:10) {
    n = varnames[i]
    checkClean(n)
    optVal = list(optValues[i])
    names(optVal) = n
    options(optVal)
    envArg = list(envVarValues[i])
    names(envArg) = n
    do.call(Sys.setenv, args = envArg)
    stopifnot(!is.null(getOption(n)) && !identical("", Sys.getenv(n)))
    expect_equal(optOrEnvVar(!!n), !!optValues[i])
    Sys.unsetenv(n)
    optVal = list(NULL)
    names(optVal) = n
    options(optVal)
    checkClean(n)
  }
})

test_that("NULL result when option is empty", {
  optname = "dummy_test_opt"
  checkClean = function() stopifnot(is.null(getOption(optname)))
  for (x in list("", logical(0), character(0), numeric(0), integer(0))) {
    checkClean()
    optArg = list(x)
    names(optArg) = optname
    options(optArg)
    if (is.null(getOption(optname))) stop("Failed to set option: ", optname)
    expect_true(is.null(optOrEnvVar(optname)))
    optArg = list(NULL)
    names(optArg) = optname
    options(optArg)
    checkClean()
  }
})

test_that("Empty opt doesn't block nonempty var", {
  name = "testing123"
  checkClean = function() {
    stopifnot(is.null(getOption(name)) && identical("", Sys.getenv(name))) }
  for (empty in list("", logical(0), character(0), numeric(0), integer(0))) {
    varVal = getRandVarName()
    checkClean()
    optArg = list(empty)
    names(optArg) = name
    options(optArg)
    envArg = list(varVal)
    names(envArg) = name
    do.call(what = Sys.setenv, args = envArg)
    if (is.null(getOption(name))) stop("Failed to set option: ", name)
    if (identical("", Sys.getenv(name))) stop("Failed to set env var: ", name)
    expect_equal(optOrEnvVar(name), varVal)
    optArg = list(NULL)
    names(optArg) = name
    options(optArg)
    Sys.unsetenv(name)
    checkClean()
  }
})

test_that("Name for which to fetch value must be text", {
  ns = list(NULL, c("PROCESSED", "RESOURCES"))
  for (n in ns) { expect_error(optOrEnvVar(!!n)) }
})
