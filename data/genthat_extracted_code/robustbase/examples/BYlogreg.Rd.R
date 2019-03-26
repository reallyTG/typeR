library(robustbase)


### Name: BYlogreg
### Title: Bianco-Yohai Estimator for Robust Logistic Regression
### Aliases: BYlogreg
### Keywords: robust regression nonlinear

### ** Examples

set.seed(17)
x0 <- matrix(rnorm(100,1))
y  <- rbinom(100, size=1, prob= 0.5) # ~= as.numeric(runif(100) > 0.5)
BY <- BYlogreg(x0,y)
BY <- BYlogreg(x0,y, trace.lev=TRUE)

## The "Vaso Constriction"  aka "skin" data:
data(vaso)
vX <- model.matrix( ~ log(Volume) + log(Rate), data=vaso)
vY <- vaso[,"Y"]
head(cbind(vX, vY))# 'X' does include the intercept

vWBY <- BYlogreg(x0 = vX, y = vY, addIntercept=FALSE) # as 'vX' has it already
v.BY <- BYlogreg(x0 = vX, y = vY, addIntercept=FALSE, initwml=FALSE)
## they are relatively close:
stopifnot( all.equal(vWBY, v.BY, tolerance = 2e-4) )



