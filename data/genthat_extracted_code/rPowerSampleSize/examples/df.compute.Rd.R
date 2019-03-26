library(rPowerSampleSize)


### Name: df.compute
### Title: Computation of degrees of freedom.
### Aliases: df.compute
### Keywords: package Holm Procedure r power multiple testing sample size
###   computation

### ** Examples

## Not run: 
##D # standard deviation of the treatment effect
##D var <- c(0.3520^2,0.6219^2,0.5427^2,0.6075^2,0.6277^2,0.5527^2,0.8066^2)
##D 
##D # Correlation matrix 
##D cov <- matrix(1,ncol=7,nrow=7)
##D cov[1,2:7] <- cov[2:7,1] <- c(0.1341692,0.1373891,0.07480123,0.1401267,0.1280336,0.1614103)
##D cov[2,3:7] <- cov[3:7,2] <- c(0.2874531,0.18451960,0.3156895,0.2954996,0.3963837)
##D cov[3,4:7] <- cov[4:7,3] <- c(0.19903400,0.2736123,0.2369907,0.3423579)
##D cov[4,5:7] <- cov[5:7,4] <- c(0.1915028,0.1558958,0.2376056)
##D cov[5,6:7] <- cov[6:7,5] <- c(0.2642217,0.3969920)
##D cov[6,7] <- cov[7,6] <- c(0.3352029)
##D 
##D # Covariance matrix
##D diag(cov) <- var
##D 
##D df.compute(SigmaE = cov, SigmaC = cov, nE = 20, nC = 30)
##D 
## End(Not run)



