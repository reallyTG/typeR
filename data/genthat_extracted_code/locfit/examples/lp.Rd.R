library(locfit)


### Name: lp
### Title: Local Polynomial Model Term
### Aliases: lp
### Keywords: models

### ** Examples

data(ethanol, package="locfit")
# fit with 50% nearest neighbor bandwidth.
fit <- locfit(NOx~lp(E,nn=0.5),data=ethanol)
# bivariate fit.
fit <- locfit(NOx~lp(E,C,scale=TRUE),data=ethanol)

# density estimation
data(geyser, package="locfit")
fit <- locfit.raw(lp(geyser,nn=0.1,h=0.8))



