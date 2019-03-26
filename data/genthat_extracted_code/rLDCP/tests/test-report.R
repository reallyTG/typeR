

context("define report")

test_that("repor definition", {
  method <- function(a,b){}

  myreport <- report_template(method=method)

  expect_that (class(myreport), equals("report_template"))
  expect_that (myreport$properties, equals(NULL))
  expect_that (myreport$method, equals(method))
  expect_that (myreport$description, equals(NULL))

})
