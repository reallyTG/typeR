context("Py script locators and validators")

test_that("check_py throws error on unsupported version of python", {
  expect_error(check_py_script(4),
               regexp = "Please specify one of '2' or '3'", fixed = TRUE)
  expect_error(check_py_script(TRUE),
               regexp = "Please specify one of '2' or '3'", fixed = TRUE)
})


test_that("check_py throws message since script doesn't exist in test environment",{
  expect_equal(check_py_script("3"),
               "Python 3 exporter does not exist")
  expect_equal(check_py_script("2"),
               "Python 2 exporter does not exist")
})



test_that("find_py throws error on unsupported version of python", {
  expect_error(find_py_script(4),
               regexp = "Must be one of '2' or '3'", fixed = TRUE)
  expect_error(find_py_script(TRUE),
               regexp = "Must be one of '2' or '3'", fixed = TRUE)
})

test_that("find_py does not throw error on supported versions of python", {
  expect_error(find_py_script('3'), NA)
  expect_error(find_py_script('2'), NA)
})
