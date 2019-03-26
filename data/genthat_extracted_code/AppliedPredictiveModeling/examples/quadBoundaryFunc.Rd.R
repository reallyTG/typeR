library(AppliedPredictiveModeling)


### Name: quadBoundaryFunc
### Title: Functions for Simulating Data
### Aliases: quadBoundaryFunc easyBoundaryFunc
### Keywords: utilities

### ** Examples

## in Chapter 11, 'Measuring Performance in Classification Model'
set.seed(975)
training <- quadBoundaryFunc(500)
testing <- quadBoundaryFunc(1000)
 

## in Chapter 20, 'Factors That Can Affect Model Performance'
set.seed(615)
dat <- easyBoundaryFunc(200, interaction = 3, intercept = 3)
dat$X1 <- scale(dat$X1)
dat$X2 <- scale(dat$X2)
dat$Data <- "Original"
dat$prob <- NULL

## in Chapter X, 'An Introduction to Feature Selection'

set.seed(874)
reliefEx3 <- easyBoundaryFunc(500)
reliefEx3$X1 <- scale(reliefEx3$X1)
reliefEx3$X2 <- scale(reliefEx3$X2)
reliefEx3$prob <- NULL




