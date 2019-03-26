library(smooth)


### Name: covar
### Title: Function returns the covariance matrix of conditional multiple
###   steps ahead forecast errors
### Aliases: covar covar.smooth
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


x <- rnorm(100,0,1)

# A simple example with a 5x5 covariance matrix
ourModel <- ces(x, h=5)
covar(ourModel)




