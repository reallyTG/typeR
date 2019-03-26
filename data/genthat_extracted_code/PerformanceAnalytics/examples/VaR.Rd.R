library(PerformanceAnalytics)


### Name: VaR
### Title: calculate various Value at Risk (VaR) measures
### Aliases: VaR VaR.CornishFisher

### ** Examples


    data(edhec)

    # first do normal VaR calc
    VaR(edhec, p=.95, method="historical")

    # now use Gaussian
    VaR(edhec, p=.95, method="gaussian")

    # now use modified Cornish Fisher calc to take non-normal distribution into account
    VaR(edhec, p=.95, method="modified")

    # now use p=.99
    VaR(edhec, p=.99)
    # or the equivalent alpha=.01
    VaR(edhec, p=.01)

    # now with outliers squished
    VaR(edhec, clean="boudt")

    # add Component VaR for the equal weighted portfolio
    VaR(edhec, clean="boudt", portfolio_method="component")




