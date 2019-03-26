context("Check xrefs")

test_that("Check case-sensitivity", {
  expect_error(check_xrefs("./check-xrefs/case-sensitive.tex", permitted.case = "upper"))
  expect_error(check_xrefs("./check-xrefs/case-sensitive-C.tex", permitted.case = "upper"))
  expect_error(check_xrefs("./check-xrefs/case-sensitive-lower.tex", permitted.case = "lower"))
  expect_error(check_xrefs("./check-xrefs/case-sensitive-lower-C.tex", permitted.case = "lower"))
  expect_null(check_xrefs("./check-xrefs/case-sensitive-C.tex", permitted.case = "lower"))
  expect_null(check_xrefs("./check-xrefs/case-sensitive-C.tex"))
  expect_error(check_xrefs("./check-xrefs/case-sensitive-both.tex"))
  expect_null(check_xrefs("./check-xrefs/case-sensitive-both.tex", permitted.case = NULL))
})

test_that("Literal xrefs are detected", {
  expect_null(check_literal_xrefs("./check-xrefs/no-literals-xrefs.tex"))
  expect_error(check_literal_xrefs("./check-xrefs/literals-xrefs.tex"),
               regexp = "Hard-coded xref")
})




