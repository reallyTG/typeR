
test_that("bandwidth estimators", {

  expect_silent(bw.scott(mtcars))
  expect_silent(bw.silv(mtcars))

  expect_error(bw.scott(1:10))
  expect_error(bw.silv(1:10))

  dat <- mtcars
  dat[2:3, 2:3] <- NA
  expect_true(anyNA(bw.scott(dat)))
  expect_true(anyNA(bw.silv(dat)))

  expect_false(anyNA(bw.scott(dat, na.rm = TRUE)))
  expect_false(anyNA(bw.silv(dat, na.rm = TRUE)))

  expect_false(identical(bw.scott(dat, na.rm = FALSE), bw.scott(dat, na.rm = TRUE)))
  expect_false(identical(bw.silv(dat, na.rm = FALSE), bw.scott(dat, na.rm = TRUE)))

})


