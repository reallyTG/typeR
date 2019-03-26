library(RMKdiscrete)


### Name: negbin
### Title: Helper functions for the (unvariate) negative binomial
###   distribution.
### Aliases: dnegbin negbinMVP

### ** Examples

## These two lines do the same thing:
dnegbin(x=1,nu=2,p=0.5)
dnbinom(x=1,size=2,prob=0.5)

## What is the mean of this distribution?
negbinMVP(nu=2,p=0.5) #<--mu=2

## These two lines also do the same thing:
dnegbin(x=1,nu=2,mu=2)
dnbinom(x=1,size=2,mu=2)

## Parametrize with mu & p:
dnegbin(x=1,mu=2,p=0.5)
## Not run (will throw an error):
## dnbinom(x=1,prob=0.5,mu=2) 



