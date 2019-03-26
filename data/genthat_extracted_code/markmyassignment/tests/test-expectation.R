
context("expectations")

test_that(desc="expect_function_self_contained()",{
  h <- "1"
  f <- function() h
  g <- function() h <- 1; h
  expect_failure(expect_function_self_contained(object = f), message = "`f` contain global variable\\(s\\): h\\.")
  expect_success(expect_function_self_contained(object = g))
  
  expect_warning(expect_self_contained(object = g), "Deprecated")
})


test_that(desc="expect_attached_package()",{
  expect_success(expect_attached_package("base"))
  expect_failure(expect_attached_package("advfsda"), message = "Package \\'advfsda\\' is not used \\(attached\\)\\.")
  
  expect_warning(expect_package("base"), "Deprecated")
})

test_that(desc="expect_no_attached_forbidden_package()",{
  expect_failure(expect_no_attached_forbidden_package("base"), message = "Package 'base' is forbidden\\.")
  expect_success(expect_no_attached_forbidden_package("advfsda"))
})


test_that(desc="expect_function_arguments()",{
  f <- function(x, y) x^2
  g <- function() 3
  expect_failure(expect_function_arguments(f, "x"), message = "`f` should contain arguments x, not x y.")
  expect_success(expect_function_arguments(f, expected = c("x", "y")))
  expect_failure(expect_function_arguments(f, expected = c("x", "y", "z")), message = "`f` should contain arguments x y z, not x y.")
  expect_success(expect_function_arguments(g, NULL))
})


test_that(desc="expect_function_code()",{
  expect_success(expect_function_code(object = base::mean, expected = "UseMethod"))
  expect_failure(expect_function_code(object = base::mean, expected = "markmyassignment"), message = "'markmyassignment' not found in the body of base::mean")
})


test_that(desc="expect_no_forbidden_function_code()",{
  expect_failure(expect_no_forbidden_function_code(object = base::mean, forbidden = "UseMethod"), message = "Forbidden code 'UseMethod' is found in the body of base::mean")
  expect_success(expect_no_forbidden_function_code(object = base::mean, forbidden = "markmyassignment"))
})

