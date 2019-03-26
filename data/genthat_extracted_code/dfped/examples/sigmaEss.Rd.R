library(dfped)


### Name: sigmaEss
### Title: The variance of the effective sample size (ESS).
### Aliases: sigmaEss

### ** Examples

## Not run: 
##D     wm_mat <- c(0.10, 0.21, 0.33, 0.55, 0.76 )
##D     wm_allo <- c(0.13, 0.27, 0.48, 0.70, 0.88)
##D     wm_linear <- c(0.07, 0.13, 0.21, 0.33, 0.55)
##D     c <- 10000
##D     meana <- 0.88
##D     Tmc <- 100000
##D     Mmax <- 30
##D     Mmin <- 1
##D     sigma_vect <- seq(0.1, 2, by = 0.01)
##D     mStar <- 30
##D     sigmaEss(mStar, sigma_vect, Mmin, Mmax, meana, c, wm_mat, Tmc)
## End(Not run)



