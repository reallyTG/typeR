context("getcells")

test_that("getcells works", {
  skip_on_cran()

  tt <- getcells("POLYGON ((-48.177685950413291 15.842380165289299,
   -48.177685950413291 15.842380165289299,
   -54.964876033057919 28.964280991735578,
   -35.960743801652967 27.606842975206646,
   -48.177685950413291 15.842380165289299))")

  expect_type(tt, "integer")
  expect_type(tt[1], "integer")
  expect_gt(length(tt), 10)
})

test_that("getcells fails well", {
  expect_error(getcells(), "argument \"shape\" is missing")

  expect_error(
    getcells("POLYGON ((-48.177685950413291 15.842380165289299,
             -48.177685950413291 15.842380165289299,
             -54.964876033057919 28.964280991735578,
             -35.960743801652967 27.606842975206646,
             -48.177685950413291 15.8423801652892))", TRUE),
    "The WKT object is closed but does not have matching start/end points"
  )

  wkt <- 'POLYGON((30 20, 10 40, 45 40, 30 20), (15 5, 5 10, 10 20, 40 10, 15 5))'
  expect_error(getcells(wkt, check_wkt = TRUE),
    "The WKT object has a different orientation from the default"
  )

  wkt <- "MULTIPOLYGON(((15 5,40 10,10 20,5 10,15 5)), ((30 20,10 40,45 40,30 20)))"
  expect_error(
    getcells(wkt, check_wkt = TRUE),
    "The WKT object has a different orientation from the default"
  )
  expect_error(
    getcells(wkt, check_wkt = TRUE),
    "use wicket"
  )
  # after fixing orientation, it works
  expect_type(
    getcells(wicket::wkt_correct(wkt), check_wkt = TRUE),
    "integer"
  )

  wkt <- "POLYGON((15 5,40 10,10 20,5 10,15 5), (30 20,10 40,45 40,30 20))"
  expect_error(
    getcells(wkt, check_wkt = TRUE),
    "The WKT object has a different orientation from the default"
  )
  expect_error(
    getcells(wkt, check_wkt = TRUE),
    "use wicket"
  )
  # after fixing orientation, get a diff. error about interior rings outside
  # exterior ring
  expect_error(
    getcells(wicket::wkt_correct(wkt), check_wkt = TRUE),
    "The WKT object has interior rings sitting outside its exterior ring"
  )
  expect_error(
    getcells(wicket::wkt_correct(wkt), check_wkt = TRUE),
    "use MULTIPOLYGON instead"
  )
})
