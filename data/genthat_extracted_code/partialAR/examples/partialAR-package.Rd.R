library(partialAR)


### Name: partialAR-package
### Title: Partial autoregression
### Aliases: partialAR-package partialAR
### Keywords: package

### ** Examples


    set.seed(1)
    x <- rpar(1000, 0.8, 1, 0.5)  # Generate a random PAR sequence
    fit.par(x)                  # Estimate its parameters
    plot(fit.par(x))            # Plot the estimate
    test.par(x)                 # Test the goodness of fit

## No test: 
    # An example involving European stock market data
    data(EuStockMarkets)   # European Stock Markets 1991-1998
    
    # Check for cointegration between German DAX and Swiss SMI
    library(egcm)
    egcm(log(EuStockMarkets[,c("DAX", "SMI")]))
    
    # The series are not found to be cointegrated.
    # Perhaps they are partially cointegrated?  Check the residuals
    # of the cointegration fit for partial autoregression:
    fit.par(egcm(EuStockMarkets[,c("DAX", "SMI")])$residuals)
    
    # A plot of the model looks promising:
    ## Not run: plot(fit.par(egcm(EuStockMarkets[,c("DAX", "SMI")])$residuals))
    
    # 74% of the variance is attributed to a mean-reverting
    # AR(1) process.  However, it is important to check whether this is
    # a better explanation than a simple random walk:
    test.par(egcm(EuStockMarkets[,c("DAX", "SMI")])$residuals)
    
    # The p-value is found to be 0.36, so the random walk hypothesis
    # cannot be rejected.
    
    # Another example involving a potential pairs trade between
    # Coca-Cola and Pepsi.
    
    # Fetch the price series for Coca-Cola (KO) and Pepsi (PEP) in 2014
    library(TTR)
    KO <- getYahooData("KO", 20140101, 20141231)$Close
    PEP <- getYahooData("PEP", 20140101, 20141231)$Close
    
    # Check whether they were cointegrated
    egcm(KO,PEP)
    
    # It turns out that they are not cointegrated.  Perhaps a better
    # fit can be obtained with the partially autoregressive model:
    fit.par(egcm(KO,PEP)$residuals)
    
    # The mean-reverting component of the above fit explains 90% of
    # the variance of the daily returns.  Thus, it appears that the
    # two series are close to being cointegrated.  A plot further
    # confirms this:
    plot(fit.par(egcm(KO,PEP)$residuals))
    
    # Still, it is important to check whether or not the residual
    # series is simply a random walk:
    test.par(egcm(KO,PEP)$residuals)
    
    # In this case, the p-value associated with the hypothesis that
    # the series is partially autoregressive is 0.12.  Thus, the
    # evidence of partial autoregression is marginal. The random walk
    # may be a better explanation.   
## End(No test)



