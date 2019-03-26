library(rPowerSampleSize)


### Name: matrix.type.compute
### Title: Computation of matrix type
### Aliases: matrix.type.compute
### Keywords: package Holm Procedure r power multiple testing sample size
###   computation

### ** Examples

## Not run: 
##D # Variances of the m endpoints
##D var <- c(0.3520, 0.6219, 0.5427, 0.6075, 0.6277,
##D 0.5527, 0.8066) ^ 2
##D 
##D # Covariance matrix
##D cov <- matrix(1, ncol = 7, nrow = 7)
##D  cov[1, 2:7] <- cov[2:7, 1] <- c(0.1341692, 0.1373891, 0.07480123,
##D 0.1401267, 0.1280336, 0.1614103)
##D cov[2, 3:7] <- cov[3:7, 2] <- c(0.2874531, 0.18451960, 0.3156895,
##D 0.2954996, 0.3963837)
##D cov[3, 4:7] <- cov[4:7, 3] <- c(0.19903400, 0.2736123, 0.2369907, 0.3423579)
##D cov[4, 5:7] <- cov[5:7, 4] <- c(0.1915028, 0.1558958, 0.2376056)
##D cov[5, 6:7] <- cov[6:7, 5] <- c(0.2642217, 0.3969920)
##D cov[6, 7] <- cov[7, 6] <- 0.3352029
##D diag(cov) <- var
##D 
##D matrix.type.compute(SigmaE = cov, SigmaC = cov, display = TRUE)
## End(Not run)



