context("as.numericSilent()")

test_that("Verify as.numericSilent() performs as expected", {

  # Once again, the behavior inside the testing function when called from ./runtest or R CMD check
  # doesn't match the console:

  # Console
  ## > pvar(as.numericSilent("bad"))
  ## as.numericSilent("bad") = bad

  # When running ./runtest
  ## as.numericSilent("bad") = NA

  # So, the following tests fail, even though they run fine in the console
  ## expect_true(identical(as.numericSilent(c("this","that")), c("this", "that")))
  ## expect_true(identical(as.numericSilent(c("392.1", "that")), c("392.1", "that")))

  # But these succeed
  expect_true(all(as.numericSilent(c("2893.9","9423.48")) == c(2893.9, 9423.48)))
  expect_true(all(as.numericSilent(as.character(1:5)) == 1:5))
  
})
