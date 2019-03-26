context("Test whether py_ready can determine whether the py script exists in dir")

test_that("py_ready throws an error when no py script exists", {
  expect_error(py_ready(),
               regexp = "No 'lastexport' script detected.*")
})

install_scrobble_script(version = "3")
test_that("py_ready does not throw error when py3 script does exist", {
  expect_error(py_ready(), NA)
})

file.remove("lastexport.py")


install_scrobble_script(version = "2")
test_that("py_ready does not throw error when py2 script does exist", {
  expect_error(py_ready(), NA)
})

file.remove("lastexport2.py")
