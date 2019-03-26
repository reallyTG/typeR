context("Import GHCN files")
library(VFS)

# ten years of GHCN dly data
weather <- read.dly("ghcntest.dly")
days <- rep(c(366, 365, 365, 365), length=10)


test_that("output object is as expected", {
    expect_is(weather, "data.frame")
    expect_equal(dim(weather), c(sum(days), 51))
})

test_that("leap years are correctly handled", {
    # note that 2000 is correctly a leap year
    expect_equal(as.vector(table(weather$YEAR)), days)
})

test_that("data values are imported correctly", {
    # using PRCP as a test
    expect_equal(sum(is.na(weather$PRCP.VALUE)), 31)
    # entirely missing month is expanded
    expect_equal(sum(is.na(weather$PRCP.VALUE[weather$YEAR == 2000 & weather$MONTH == 5])), 31)
    expect_equal(sum(weather$PRCP.VALUE, na.rm=TRUE) * 10, 100758)
})


