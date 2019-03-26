library(maxLik)


### Name: maxLik-package
### Title: Maximum Likelihood Estimation
### Aliases: maxLik-package
### Keywords: Basics|package Mathematics|optimize

### ** Examples

## estimate mean and variance of normal random vector
set.seed( 123 )
x <- rnorm(50, 1, 2 )

## log likelihood function.
## Note: 'param' is a vector
llf <- function( param ) {
   mu <- param[ 1 ]
   sigma <- param[ 2 ]
   llValue <- dnorm(x, mean=mu, sd=sigma, log=TRUE)
   return(sum(llValue))
}

## Estimate it.  Take standard normal as start values
ml <- maxLik( llf, start = c(mu=0, sigma=1) )
print(summary(ml))
## Estimates close to c(1,2) :-)

## Example how to use maxLik in your own function and allow users
## to override the default parameters
##
## 'estimate': user contructed estimation routine
## Note: it accepts both 'control' and '...'
estimate <- function(control=NULL, ...) {
   return(maxLik(llf, start=c(1,1),
                 control=c(list(iterlim=100), control),
                           # user-supplied 'control' overrides default
                           # 'iterlim=100'
                 ...))
}
m <- estimate(control=list(iterlim=1), fixed=2)
                           # user can override default 'iterlim' and
                           # supply additional parameters ('fixed')
show(maxControl(m))
                           # iterlim should be 1
print(coef(m))
                           # sigma should be 1.000




