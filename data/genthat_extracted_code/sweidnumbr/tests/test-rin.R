
context("roin and rpin")

test_that(desc="roin",{
  expect_silent(x <- roin(100000))
})

test_that(desc="rpin",{
  expect_silent(x <- rpin(100000))
  expect_silent(x <- rpin(100000, p.male = 0))
  expect_equal(as.numeric(table(pin_sex(x))), 100000)
  expect_silent(x <- rpin(100000, p.coordn = 0))
  expect_equal(as.numeric(table(pin_coordn(x))), 100000)
  expect_silent(x <- rpin(100000, start_date = "2000-01-01", end_date = "2000-01-01"))
  suppressMessages(expect_equal(as.numeric(table(pin_age(x))), 100000))
})
