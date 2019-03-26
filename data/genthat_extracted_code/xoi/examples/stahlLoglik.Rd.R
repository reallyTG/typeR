library(xoi)


### Name: stahlLoglik
### Title: Calculate log likelihood for Stahl model
### Aliases: stahlLoglik
### Keywords: models

### ** Examples


data(bssbsb)
xoloc <- find.breaks(bssbsb, chr=1)

loglik <- stahlLoglik(xoloc, nu=4, p=c(0.05, 0.1, 0.15))




