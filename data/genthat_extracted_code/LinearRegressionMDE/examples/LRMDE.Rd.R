library(LinearRegressionMDE)


### Name: LRMDE
### Title: Performs minimum distance estimation in linear regression model:
###   Y=Xb + error
### Aliases: LRMDE

### ** Examples

X <- matrix(c(1,1,3,4, 4,2), nrow=3, ncol=2)
Y <- c(1,-5, 8)
bhat <- LRMDE(Y,X)



