# test_listff.R
# Tests of name resolution search prioritization.
# Author: Vince Reuter
# Email: vpr9v@virginia.edu

context("test_listff")

test_that("Function/value matrix is empty when no variables are set", {
  expect_true(is.null(listff()))
})

test_that("variables table is accurate across variables count", {
  varnames = c("testDummyA", "testDummyB", "testDummyC")
  values = c("first", "second", "third")
  N = length(varnames)
  if (N != length(values)) stop(sprintf(
    "%d names and %d values", length(varnames), length(values)))
  makeVarName = function(var) paste0(.FFTAGOPT, var)
  makeFunName = function(var) paste0(.FFTAGFUNC, var)
  checkClean = function(ns) {
    extantVars = Filter(function(vn) !is.null(getOption(vn)), sapply(ns, makeVarName))
    if (length(extantVars) > 0) stop(
      "Preset names: ", paste0(extantVars, collapse = ", "))
    extantFuns = Filter(function(fn) exists(fn), sapply(ns, makeFunName))
    if (length(extantFuns) > 0) stop(
      "Preset functions: ", paste0(extantFuns, collapse = ", "))
  }
  for (i in 1:N) {
    vns = varnames[1:i]
    xs = values[1:i]
    checkClean(vns)
    for (j in 1:i) { setff(vns[j], xs[j]) }
    ffTab = listff()
    expect_equal(nrow(ffTab), length(vns))
    expect_equal(ncol(ffTab), 2)
    expect_equal(0, length(setdiff(ffTab[, 1], sapply(vns, makeFunName))))
    expect_equal(0, length(setdiff(ffTab[, 2], xs)))
    for (n in vns) { cleanFfSetting(n) }
    checkClean(vns)
  }
})
