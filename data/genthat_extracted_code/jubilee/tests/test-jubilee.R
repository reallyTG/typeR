library(xts)
library(zoo)

context("Test on jubilee")

eps <- 0.001 # default tolerance of error for real number
eps5 <- 0.00001 # high precision

# -----------------------------------------------------------------

repo <- jubilee.repo(online=FALSE)
dtb <- repo@ie

subset1m <- function(df, frac) {
    if (length(frac) > 1) {
        return(sapply(frac, function(x) subset1m(df,x)))
    }
    subset(df, fraction > frac & fraction < frac+1/12)
}

# --------------------------------------------------------
# test utility functions

test_that("test eqty_ols",{
    v1 <- jubilee.eqty_ols(dtb, 1970, 50)
    v2 <- c(11.8671626, 0.1008371)
    err <- max(abs(v2/v1-1))
    expect_true(err < eps)
})

test_that("test jubilee.forward_rtn",{
    dtb$fwd.rtn.10 <- jubilee.forward_rtn(dtb$fraction, dtb$log.tri, 10)
    v1 <- head(subset(dtb, fraction >= 1990),1)$fwd.rtn.10
    v2 <- 0.16745
    err <- max(abs(v2/v1-1))
    expect_true(err < eps)
})

test_that("test jubilee.backward_rtn",{
    dtb$bwd.rtn.10 <- jubilee.backward_rtn(dtb$fraction, dtb$log.tri, 10)
    v1 <- tail(subset(dtb, fraction <= 2000+1/12),1)$bwd.rtn.10
    v2 <- 0.16745
    err <- max(abs(v2/v1-1))
    expect_true(err < eps)
})


# fraction
test_that("test daily2fraction",{
    x <- y <- c()
    x[1] <- daily2fraction(as.Date("2017-01-15"))
    y[1] <- 2017.038
    x[2] <- daily2fraction(as.Date("2017-02-14"))
    y[2] <- 2017.122
    err <- max(abs(x/y-1))
    expect_true(err < eps5)
})

test_that("test cape10 for one month",{
    cape10 <- jubilee.calc_cape(dtb, 10)
    J <- which(dtb$fraction > 2018 & dtb$fraction < 2018+1/12)
    v1 <- dtb$cape10[J]
    cape10 <- jubilee.calc_cape(dtb, 10)
    v2 <- cape10[J]
    err <- max(abs(v2/v1-1))
    expect_true(err < eps5)
})

test_that("test OLS of log.tri for one month",{
    df <- jubilee.ols(dtb$fraction, dtb$log.tri, 50)
    x <- as.numeric(subset1m(df, 1970))
    y <- c(1970.042, 11.86401, 0.1007617, 0.02103105)
    err <- max(abs(x/y-1))
    expect_true(err < eps)
})

# --------------------------------------------------------
# basic data test

test_that("test rate.gs10 data",{
    frac <- c(1920, 2018)
    x <- as.numeric(subset1m(dtb, frac)$rate.gs10)
    y <- c(4.97, 2.58)
    err <- max(abs(x/y-1))
    expect_true(err < eps5)
})

test_that("test rate.tb3ms data",{
    frac <- c(1920, 2018)
    x <- as.numeric(subset1m(dtb, frac)$rate.gs10)
    y <- c(4.50, 1.41)
    err <- max(abs(x/y-1))
    expect_true(err < eps5)
})

test_that("test gold data",{
    frac <- c(1802, 1969, 2018)
    x <- as.numeric(subset1m(dtb, frac)$rate.gs10)
    y <- c(19.39, 42.291, 1332.809)
    err <- max(abs(x/y-1))
    expect_true(err < eps5)
})

test_that("test unrate data",{
    frac <- c(1930, 2018)
    x <- as.numeric(subset1m(dtb, frac)$unrate)
    y <- c(2.2, 4.1)
    err <- max(abs(x/y-1))
    expect_true(err < eps5)
})

test_that("test rate.baa data",{
    frac <- c(1920, 2018)
    x <- as.numeric(subset1m(dtb, frac)$rate.baa)
    y <- c(7.78, 4.26)
    err <- max(abs(x/y-1))
    expect_true(err < eps5)
})

# --------------------------------------------------------


