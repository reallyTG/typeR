library(GB2)


### Name: MLfitGB2
### Title: Fitting the GB2 by the Method of Maximum Likelihood Estimation
###   and Comparison of the Fitted Indicators with the Empirical Indicators
### Aliases: MLfitGB2 main.emp mlfit.gb2
### Keywords: distribution

### ** Examples

# An example of using the function mlfit.gb2
# See also the examples of ml.gb2 and mlprof.gb2

## Not run: 
##D library(laeken)
##D data(eusilc)
##D 
##D # Income
##D inc <- as.vector(eusilc$eqIncome)
##D 
##D # Weights
##D w <- eusilc$rb050
##D 
##D # Data set
##D d <- data.frame(inc, w)
##D d <- d[!is.na(d$inc),]
##D 
##D # Truncate at 0
##D inc <- d$inc[d$inc > 0]
##D w   <- d$w[d$inc > 0]
##D 
##D # ML fit
##D m1 <- mlfit.gb2(inc,w)
##D 
##D # GB2 fitted parameters and indicators through maximum likelihood estimation
##D m1[[1]]
##D # The fit using the full log-likelihood
##D m1[[2]]
##D # The fit using the profile log-likelihood
##D m1[[3]]
##D 
##D # ML fit, when no weights are avalable 
##D m2 <- mlfit.gb2(inc)
##D # Results
##D m2[[1]]
## End(Not run)



