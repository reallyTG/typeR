library(PerformanceAnalytics)


### Name: StdDev
### Title: calculates Standard Deviation for univariate and multivariate
###   series, also calculates component contribution to standard deviation
###   of a portfolio
### Aliases: StdDev

### ** Examples


    data(edhec)

    # first do normal StdDev calc
    StdDev(edhec)
    # or the equivalent
    StdDev(edhec, portfolio_method="single")

    # now with outliers squished
    StdDev(edhec, clean="boudt")

    # add Component StdDev for the equal weighted portfolio
    StdDev(edhec, clean="boudt", portfolio_method="component")





