library(np)


### Name: npqreg
### Title: Kernel Quantile Regression with Mixed Data Types
### Aliases: npqreg npqreg.call npqreg.condbandwidth npqreg.default
###   npqreg.formula
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we compute a
##D # bivariate nonparametric quantile regression estimate for Giovanni
##D # Baiocchi's Italian income panel (see Italy for details)
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # First, compute the cross-validated bandwidths.  Note - this may take a
##D # few minutes depending on the speed of your computer...
##D 
##D bw <- npcdistbw(formula=gdp~ordered(year))
##D 
##D # Note - numerical search for computing the quantiles may take a minute
##D # or so...
##D 
##D model.q0.25 <- npqreg(bws=bw, tau=0.25)
##D model.q0.50 <- npqreg(bws=bw, tau=0.50)
##D model.q0.75 <- npqreg(bws=bw, tau=0.75)
##D 
##D # Plot the resulting quantiles manually...
##D 
##D plot(ordered(year), gdp, 
##D      main="CDF Quantile Estimates for the Italian Income Panel", 
##D      xlab="Year", 
##D      ylab="GDP Quantiles")
##D 
##D lines(ordered(year), model.q0.25$quantile, col="red", lty=2)
##D lines(ordered(year), model.q0.50$quantile, col="blue", lty=3)
##D lines(ordered(year), model.q0.75$quantile, col="red", lty=2)
##D 
##D legend(ordered(1951), 32, c("tau = 0.25", "tau = 0.50", "tau = 0.75"), 
##D        lty=c(2, 3, 2), col=c("red", "blue", "red"))
##D 
##D detach(Italy)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we compute a
##D # bivariate nonparametric quantile regression estimate for Giovanni
##D # Baiocchi's Italian income panel (see Italy for details)
##D 
##D data("Italy")
##D attach(Italy)
##D data <- data.frame(ordered(year), gdp)
##D 
##D # First, compute the likelihood cross-validation bandwidths (default).
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D bw <- npcdistbw(xdat=ordered(year), ydat=gdp)
##D 
##D # Note - numerical search for computing the quantiles will take a
##D # minute or so...
##D 
##D model.q0.25 <- npqreg(bws=bw, tau=0.25)
##D model.q0.50 <- npqreg(bws=bw, tau=0.50)
##D model.q0.75 <- npqreg(bws=bw, tau=0.75)
##D 
##D # Plot the resulting quantiles manually...
##D 
##D plot(ordered(year), gdp, 
##D      main="CDF Quantile Estimates for the Italian Income Panel", 
##D      xlab="Year", 
##D      ylab="GDP Quantiles")
##D 
##D lines(ordered(year), model.q0.25$quantile, col="red", lty=2)
##D lines(ordered(year), model.q0.50$quantile, col="blue", lty=3)
##D lines(ordered(year), model.q0.75$quantile, col="red", lty=2)
##D 
##D legend(ordered(1951), 32, c("tau = 0.25", "tau = 0.50", "tau = 0.75"), 
##D        lty=c(2, 3, 2), col=c("red", "blue", "red"))
##D 
##D detach(Italy)
## End(Not run) 



