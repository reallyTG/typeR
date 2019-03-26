context("as.year")

test_that("as.year", {
  expect_that(as.year(Sys.Date()), is_a("year"))
  expect_that(as.year(2000:2015), is_a("year"))
  expect_that(as.year(3000), throws_error())
  expect_that(as.year(1799), throws_error())
})


x <- y <-  as.year(2000:2015)
y[1:5] <- 1800:1804

test_that("subsetting", {
  expect_that(x[1:5], is_a("year"))
  expect_that(x[1:5] <- "kjhg", throws_error())
  expect_that(y, is_a("year"))
  
})



test_that("min/max", {
  expect_that(min(x), is_a("year"))
  expect_that(max(x), is_a("year"))
})