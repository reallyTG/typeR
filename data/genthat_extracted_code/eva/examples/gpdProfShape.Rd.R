library(eva)


### Name: gpdProfShape
### Title: GPD Shape Parameter Profile Likelihood Estimation for Stationary
###   Models
### Aliases: gpdProfShape

### ** Examples

x <- rgpd(200, loc = 0, scale = 1, shape = 0.25)
z <- gpdFit(x, threshold = 0)
gpdProfShape(z)



