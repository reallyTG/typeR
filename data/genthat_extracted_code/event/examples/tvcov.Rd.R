library(event)


### Name: tvcov
### Title: Create a Vector of Time-varying Covariates for a Point Process
### Aliases: tvcov
### Keywords: manip

### ** Examples

y <- c(5,3,2,4)
x <- c(1,2,2,1,2,2,1)
tx <- c(2,3,1,2,2,2,2)
zcov <- tvcov(y, x, tx)
zcov



