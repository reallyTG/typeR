context("basic palr")

funs <- list(chlPal, sstPal, icePal)
test_that("pal functions work", {
  for (i in seq_along(funs)) {
    expect_that(funs[[i]](10), is_a("character"))
    expect_that(funs[[i]](c(1, 5, 10)), is_a("character"))
    expect_that(funs[[i]](palette = TRUE), is_a("list"))
  }
})

test_that("times give colours", {
  pal <- mk_timePal(Sys.Date() + 1:10, rainbow(10))
  expect_that(pal(Sys.time()), is_a("character"))
})

test_that("colours give hex", {
  expect_that(grepl("^#", col2hex("red")), is_true())
})
