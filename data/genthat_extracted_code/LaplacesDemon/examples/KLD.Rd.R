library(LaplacesDemon)


### Name: KLD
### Title: Kullback-Leibler Divergence (KLD)
### Aliases: KLD
### Keywords: Distribution Elicitation Reference Priors

### ** Examples

library(LaplacesDemon)
px <- dnorm(runif(100),0,1)
py <- dnorm(runif(100),0.1,0.9)
KLD(px,py)



