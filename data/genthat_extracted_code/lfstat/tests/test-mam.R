context("Functions from Tallaksen and van Lanen (2004)")
data(ngaruroro)


test_that("reproducing Tallaksen and van Lanen (2004), Example 5.2: mean annual minima", {

  ng <- as.xts(ngaruroro)

  year <- water_year(time(ng), origin = "Sept")
  ng10 <- ng[year %in% 1991:2000, ]

  mam <- apply.seasonal(ng10, varying = "yearly", aggregate = mean, origin = 9)
  expect_equal(round(mam, 2), 4.14)

  ng10$ma7 <- ma(ng10$discharge, sides = 2, n = 7)
  mam <- apply.seasonal(ng10$ma7, varying = "yearly", aggregate = mean, origin = 9)
  expect_equal(round(mam, 2), 4.40)

  ng10$ma30 <- ma(ng10$discharge, sides = 2, n = 30)
  mam <- apply.seasonal(ng10$ma30, varying = "yearly", aggregate = mean, origin = 9)
  expect_equal(round(mam, 2), 5.44)
})


test_that("apply_seasonal() returns the same results as MAM", {

  ng <- as.xts(ngaruroro)


  old <- MAM(ngaruroro, yearly = TRUE, n = 1)
  new <- apply.seasonal(ng$discharge, "yearly", origin = hyear_start(ngaruroro))
  expect_equal(unname(new[as.character(old$hyear), ]), old[, 2])
  expect_equal(old[, 2], unname(new[, 1]))

  old <- MAM(ngaruroro, yearly = FALSE, n = 1)
  new <- apply.seasonal(ng$discharge, "yearly", origin = hyear_start(ngaruroro),
                        agg = mean)
  expect_equal(old, new)

  #fails, because MAM does not introduce NAs at the boundaries when calculating moving averages
#   old <- MAM(ngaruroro, yearly = TRUE, n = 10)
#   ng$ma <- ma(ng$discharge, n = 10, sides = 2)
#   new <- apply.seasonal(ng$ma, "yearly", origin = 12)
#   expect_equal(new[as.character(old$hyear), ], old[, 2])
#
#   old <- MAM(ngaruroro, yearly = FALSE, n = 10)
#   new <- apply.seasonal(ng$ma, "yearly", origin = 12, agg = mean)
#   expect_equal(old, new)

  # cannot test, becuase MAM handles water year strangely
  # named seasons
  seasons <- as.Date(c("1999-03-01", "1999-11-01"))
  names(seasons) <- c("winter", "summer")
  new <- apply.seasonal(ng$discharge, varying = seasons, origin = 3)

  # unnamed seasons
  seasons <- as.Date(c("1999-01-01", "1999-04-01", "1999-07-01", "1999-10-01"))
  new <- apply.seasonal(ng$discharge, varying = seasons, origin = 1)
})




test_that("MAM warns when time series is short", {
  ng2 <- head(ngaruroro)

  expect_warning(MAM(ng2),
                 regexp = "Setting the width smoothing window to n = 6.")

  expect_warning(MAM(ng2),
                 regexp = "Probably not enough observations to calculate annual minima for the hydrological years:")
})
