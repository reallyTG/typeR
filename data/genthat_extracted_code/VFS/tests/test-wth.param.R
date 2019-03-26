context("Derive weather parameters.")
library(VFS)

# import weather data 2000-2009
weather <- read.dly(system.file("extdata", "USC00368449.dly", package = "VFS"))

delnone     <- wth.param(weather, method="poisson")
delstart    <- wth.param(weather[-c(1,2,3), ], method="poisson")
delend      <- wth.param(weather[-nrow(weather), ], method="poisson")
delboth     <- wth.param(weather[-c(1, 2, 3, nrow(weather)), ], method="poisson")

test_that("partial years are deleted", {
    expect_equal(delnone$start, 2000)
    expect_equal(delnone$end,   2009)

    expect_equal(delstart$start, 2001)
    expect_equal(delstart$end,   2009)

    expect_equal(delend$start, 2000)
    expect_equal(delend$end,   2008)

    expect_equal(delboth$start, 2001)
    expect_equal(delboth$end,   2008)
})

# generate one year of fake data

wthfake <- data.frame(weather[367:(366+365), 1:3],
    PRCP.VALUE = rep(c(0, 0, 15, 0, 3, 1, 8, 0, 22), length = 365),
    TMAX.VALUE = 1 + rev(sin(seq(0, 2 * pi, length = 365))),
    TMIN.VALUE = rev(sin(seq(0, 2 * pi, length = 365))))

wthfake.params <- wth.param(wthfake, method = "poisson")
                      
test_that("parameter values are correct", {
    expect_equal(round(wthfake.params$params$lambda, 7), 0.7484663)
    expect_equal(round(wthfake.params$params$d, 6), 9.792079)
    expect_equal(round(wthfake.params$temperature$A, 1), 0.5)
    expect_equal(round(wthfake.params$temperature$B, 1), 0.5)
    expect_equal(round(wthfake.params$temperature$C, 0), 92)
})

