if (require("testthat")) {
  test_check("scrm")
} else {
  warning("testthat not available. Skipping unittests!")
}
