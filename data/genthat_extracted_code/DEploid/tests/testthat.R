if (require("testthat")) {
  test_check("DEploid")
} else {
  warning("testthat not available. Skipping unittests!")
}
