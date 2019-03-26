library(GB2)


### Name: MLfullGB2
### Title: Maximum Likelihood Estimation of the GB2 Based on the Full
###   Log-likelihood
### Aliases: MLfullGB2 ml.gb2 mlh.gb2
### Keywords: distribution

### ** Examples

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
##D # Fit using the full log-likelihood
##D fitf <- ml.gb2(inc, w)
##D 
##D # Fitted GB2 parameters
##D af <- fitf$par[1]
##D bf <- fitf$par[2]
##D pf <- fitf$par[3]
##D qf <- fitf$par[4]
##D 
##D # Likelihood
##D flik <- fitf$value
##D 
##D # If we want to compare the indicators
##D 
##D # GB2 indicators
##D indicf <- round(main.gb2(0.6,af,bf,pf,qf), digits=3)
##D # Empirical indicators
##D indice <- round(main.emp(inc,w), digits=3)
##D 
##D # Plots
##D plotsML.gb2(inc,af,bf,pf,qf,w)
## End(Not run)



