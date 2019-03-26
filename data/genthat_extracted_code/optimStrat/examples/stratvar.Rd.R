library(optimStrat)


### Name: stratvar
### Title: Compute the Variance of Five Sampling Strategies
### Aliases: stratvar
### Keywords: survey

### ** Examples

#The assumed model coincides with the true generating model
stratvar(5000, sk = 3, n=100, H=5, d2=1, d4=1, rho=0.8, it=10)
    
#The assumed model differs with the true generating model
x<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
stratvar(x, n=100, H=5, d2=1, d4=1, b2=1.5, b4=0.5, rho=0.8, it=10)



