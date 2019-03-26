library(cdcsis)


### Name: cdcov
### Title: Conditional Distance Covariance/Correlation Statistics
### Aliases: cdcov cdcor
### Keywords: conditional covariance distance

### ** Examples

library(cdcsis)

############# Conditional Distance Correlation #############
set.seed(1)
x <- rnorm(25)
y <- rnorm(25)
z <- rnorm(25)
cdcov(x, y, z)

############# Conditional Distance Correlation #############
num <- 25
set.seed(1)
x <- rnorm(num)
y <- rnorm(num)
z <- rnorm(num)
cdcor(x, y, z)



