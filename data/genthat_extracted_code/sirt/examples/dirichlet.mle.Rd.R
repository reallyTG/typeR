library(sirt)


### Name: dirichlet.mle
### Title: Maximum Likelihood Estimation of the Dirichlet Distribution
### Aliases: dirichlet.mle
### Keywords: Dirichlet distribution

### ** Examples

#############################################################################
# EXAMPLE 1: Simulate and estimate Dirichlet distribution
#############################################################################

# (1) simulate data
set.seed(789)
N <- 200
probs <- c(.5, .3, .2 )
alpha0 <- .5
alpha <- alpha0*probs
alpha <- matrix( alpha, nrow=N, ncol=length(alpha), byrow=TRUE  )
x <- sirt::dirichlet.simul( alpha )

# (2) estimate Dirichlet parameters
dirichlet.mle(x)
  ##   $alpha
  ##   [1] 0.24507708 0.14470944 0.09590745
  ##   $alpha0
  ##   [1] 0.485694
  ##   $xsi
  ##   [1] 0.5045916 0.2979437 0.1974648

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Fitting Dirichlet distribution with frequency weights
##D #############################################################################
##D 
##D # define observed data
##D x <- scan( nlines=1)
##D     1 0   0 1   .5 .5
##D x <- matrix( x, nrow=3, ncol=2, byrow=TRUE)
##D 
##D # transform observations x into (0,1)
##D eps <- .01
##D x <- ( x + eps ) / ( 1 + 2 * eps )
##D 
##D # compare results with likelihood fitting package maxLik
##D miceadds::library_install("maxLik")
##D # define likelihood function
##D dirichlet.ll <- function(param) {
##D     ll <- sum( weights * log( ddirichlet( x, param ) ) )
##D     ll
##D }
##D 
##D #*** weights 10-10-1
##D weights <- c(10, 10, 1 )
##D mod1a <- sirt::dirichlet.mle( x, weights=weights )
##D mod1a
##D # estimation in maxLik
##D mod1b <- maxLik::maxLik(loglik, start=c(.5,.5))
##D print( mod1b )
##D coef( mod1b )
##D 
##D #*** weights 10-10-10
##D weights <- c(10, 10, 10 )
##D mod2a <- sirt::dirichlet.mle( x, weights=weights )
##D mod2a
##D # estimation in maxLik
##D mod2b <- maxLik::maxLik(loglik, start=c(.5,.5))
##D print( mod2b )
##D coef( mod2b )
##D 
##D #*** weights 30-10-2
##D weights <- c(30, 10, 2 )
##D mod3a <- sirt::dirichlet.mle( x, weights=weights )
##D mod3a
##D # estimation in maxLik
##D mod3b <- maxLik::maxLik(loglik, start=c(.25,.25))
##D print( mod3b )
##D coef( mod3b )
## End(Not run)



