context("Test py_version_to_run can deal with both scripts and no script")

test_that("No py script throws an error", {
  expect_error(py_version_to_run(),
               regexp = "object 'ver' not found", fixed = TRUE)
})


install_scrobble_script(version = "2")
test_that("Version 2 of py script is passed correctly", {
  expect_equal(py_version_to_run(),
               "lastexport2.py", fixed = TRUE)
})
file.remove("lastexport2.py")


install_scrobble_script(version = "3")
test_that("Version 3 of py script is passed correctly", {
  expect_equal(py_version_to_run(),
               "lastexport.py", fixed = TRUE)
})
file.remove("lastexport.py")
