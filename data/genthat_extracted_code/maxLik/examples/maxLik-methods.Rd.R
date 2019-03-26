library(maxLik)


### Name: AIC.maxLik
### Title: Methods for the various standard functions
### Aliases: AIC.maxLik coef.maxim coef.maxLik stdEr.maxLik
### Keywords: methods

### ** Examples

## estimate mean and variance of normal random vector
set.seed( 123 )
x <- rnorm(50, 1, 2 )
## log likelihood function.
## Note: 'param' is a vector
llf <- function( param ) {
   mu <- param[ 1 ]
   sigma <- param[ 2 ]
   return(sum(dnorm(x, mean=mu, sd=sigma, log=TRUE)))
}
## Estimate it.  Take standard normal as start values
ml <- maxLik(llf, start = c(mu=0, sigma=1) )

coef(ml)
stdEr(ml)
AIC(ml)



