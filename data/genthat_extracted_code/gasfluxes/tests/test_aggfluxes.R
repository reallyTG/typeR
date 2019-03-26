library(gasfluxes)
context("agg.fluxes checks")

test_that("agg.fluxes returns expected values", {
  datetimes <- as.POSIXct("2015-12-24 18:00:00", tz = "GMT") + (1:20)/2*24*3600
  set.seed(42)
  fluxes <- rlnorm(20, 5)
  expect_equal(agg.fluxes(fluxes, datetimes), structure(list(flux = 75238.9688519877, 
                                                             from = structure(1451023200, class = c("POSIXct", "POSIXt"), tzone = "GMT"), 
                                                             to = structure(1451844000, class = c("POSIXct", "POSIXt"), tzone = "GMT")), 
                                                        .Names = c("flux", "from", "to"), row.names = c(NA, -1L), class = "data.frame"))
  
  fluxes[5] <- NA
  expect_equal(agg.fluxes(fluxes, datetimes), structure(list(flux = 75048.311970754, 
                                                             from = structure(1451023200, class = c("POSIXct", "POSIXt"), tzone = "GMT"), 
                                                             to = structure(1451844000, class = c("POSIXct", "POSIXt"), tzone = "GMT")), 
                                                        .Names = c("flux", "from", "to"), row.names = c(NA, -1L), class = "data.frame"))
  
})