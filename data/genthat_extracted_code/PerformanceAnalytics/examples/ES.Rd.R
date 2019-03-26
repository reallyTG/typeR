library(PerformanceAnalytics)


### Name: ETL
### Title: calculates Expected Shortfall(ES) (or Conditional
###   Value-at-Risk(CVaR) for univariate and component, using a variety of
###   analytical methods.
### Aliases: ETL ES CVaR

### ** Examples


    data(edhec)

    # first do normal ES calc
    ES(edhec, p=.95, method="historical")

    # now use Gaussian
    ES(edhec, p=.95, method="gaussian")

    # now use modified Cornish Fisher calc to take non-normal distribution into account
    ES(edhec, p=.95, method="modified")

    # now use p=.99
    ES(edhec, p=.99)
    # or the equivalent alpha=.01
    ES(edhec, p=.01)

    # now with outliers squished
    ES(edhec, clean="boudt")

    # add Component ES for the equal weighted portfolio
    ES(edhec, clean="boudt", portfolio_method="component")



