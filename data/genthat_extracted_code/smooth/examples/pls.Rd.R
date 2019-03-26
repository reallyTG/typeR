library(smooth)


### Name: pls
### Title: Prediction Likelihood Score
### Aliases: pls pls.smooth
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


# Generate data, apply es() with the holdout parameter and calculate PLS
x <- rnorm(100,0,1)
ourModel <- es(x, h=10, holdout=TRUE, intervals=TRUE)
pls(ourModel, type="a")
pls(ourModel, type="e")
pls(ourModel, type="s", obs=100, nsim=100)




