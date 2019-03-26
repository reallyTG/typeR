context("marinetrophicindex")

test_that("marinetrophicindex works", {
  skip_on_cran()

  tt <- marinetrophicindex("eez", 76)

  expect_named(tt, c('level', 'year'))
  expect_is(tt, "data.frame")
  expect_type(tt$level, "double")
  expect_type(tt$year, "double")

  uu <- marinetrophicindex("eez", 76, type="fib_index")

  expect_named(uu, c('level', 'year'))
  expect_is(uu, "data.frame")
  expect_type(uu$level, "double")
  expect_type(uu$year, "double")
})

test_that("marinetrophicindex fails well", {
  expect_error(marinetrophicindex(), "argument \"region\" is missing")
  expect_error(marinetrophicindex(id = 76), "argument \"region\" is missing")

  skip_on_cran()

  expect_equal(NROW(marinetrophicindex("Asdfadf", id = 76)), 0)
})
