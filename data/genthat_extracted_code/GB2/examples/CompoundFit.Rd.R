library(GB2)


### Name: CompoundFit
### Title: Fitting the Compound Distribution based on the GB2 by the Method
###   of Maximum Likelihood Estimation
### Aliases: CompoundFit vofp.cgb2 pofv.cgb2 logl.cgb2 scores.cgb2 ml.cgb2
### Keywords: distribution

### ** Examples

## Not run: 
##D # GB2 parameters:
##D a <- 4
##D b <- 1950
##D p <- 0.8
##D q <- 0.6
##D 
##D # Proportions defining the component densities:
##D pl0 <- rep(1/3,3)
##D 
##D # Mixture probabilities
##D pl <- c(0.1,0.8,0.1)
##D 
##D # Random generation:
##D n <- 10000
##D set.seed(12345)
##D x <- rcgb2(n,a,b,p,q,pl0,pl,decomp="l")
##D 
##D # Factors in component densities
##D fac <- fg.cgb2(x,a,b,p,q, pl0,decomp="l")
##D 
##D # Estimate the mixture probabilities:
##D estim <- ml.cgb2(fac,pl0)
##D 
##D # estimated mixture probabilities:
##D estim[[1]]
##D #[1] 0.09724319 0.78415797 0.11859883
## End(Not run)



