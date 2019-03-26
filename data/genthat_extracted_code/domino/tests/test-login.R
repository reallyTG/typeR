library(domino)
context("domino login")

test_that("The login command works", {
  loginResult <- domino.login(Sys.getenv("TESTUSER"), Sys.getenv("TESTUSERPASS"), FALSE, "https://app.dominodatalab.com")

  expect_equal(loginResult, 0)
})
