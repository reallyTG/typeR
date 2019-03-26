context("catchdata")

test_that("catchdata works", {
  skip_on_cran()

  tt <- catchdata("eez", 76)

  expect_is(row.names(tt), "character")
  expect_is(names(tt), "character")
  expect_is(tt, "data.frame")
  expect_type(tt[,1], "double")
  expect_type(tt[,2], "double")
  expect_type(tt[,10], "double")
})

test_that("fails well", {
  expect_error(catchdata(), "argument \"region\" is missing")
  expect_error(catchdata(id = 76), "argument \"region\" is missing")
  expect_error(catchdata(76), "argument \"id\" is missing")

  skip_on_cran()

  expect_equal(NROW(catchdata("Asdfadf", id = 76)), 0)
})
