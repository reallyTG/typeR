library(SSM)


### Name: predict.SSM
### Title: Point prediction of smooth supersaturated models.
### Aliases: predict.SSM

### ** Examples

data(attitude)
X <- transform11(attitude[ 2:7])
Y <- attitude[ , 1]
# with no metamodel error estimating GP.
s <- fit.ssm(X, Y)
predict(s, rep(1,6))

# with metamodel error estimating GP.
s <- fit.ssm(X, Y, GP = TRUE)
predict(s, rep(1,6))



