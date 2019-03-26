context("tyears reproduces results of DWA Merkblatt")

fn <- system.file("samplesheets/donauwoerth.dat", package = "lfstat")
lfu <- readlfdata(fn, type = "LFU", baseflow = FALSE, hyearstart = 4)

lfdw <- lfu[lfu$hyear > 1959 & lfu$hyear < 2009, ]

# results calculated by lfstat
lfdw$flow <- ma(lfdw$flow, 7)
expect_warning(lfstat <- tyears(lfdw, event = c(2, 5, 10, 30, 50, 100),
                                dist="gevR", plot = FALSE))


test_that("estimated parameters of the distribution are correct", {
  expect_equal(object = round(lfstat$parameters[[1]], 2),
               expected = c(xi = -93.05, alpha = 17.73, k = 0.34))
})

test_that("estimated parameters of the distribution are correct", {
  expect_equal(object = round(lfstat$T_Years_Event[, "gevR"], 1),
               expected = c("2" = 86.9, "5" = 72.3, "10" = 65.3, "30" = 57.6,
                            "50" = 55.0, "100" = 52.2))
})

