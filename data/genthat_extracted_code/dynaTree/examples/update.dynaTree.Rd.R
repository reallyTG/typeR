library(dynaTree)


### Name: update.dynaTree
### Title: Updating a Dynamic Tree Model With New Data
### Aliases: update.dynaTree
### Keywords: methods design

### ** Examples

## simple function describing (x,y) data
f1d <- function(x, sd=0.1){
  return( sin(x) - dcauchy(x,1.6,0.15) + rnorm(1,0,sd))
} 

## initial (x,y) data
X <- seq(0, 7, length=30)
y <- f1d(X)

## PL fit to initial data
obj <- dynaTree(X=X, y=y, N=1000, model="linear")

## a predictive grid
XX <- seq(0,7, length=100)
obj <- predict(obj, XX, quants=FALSE)

## follow the ALM algorithm and choose the next
## point with the highest predictive variance
m <- which.max(obj$var)
xstar <- drop(obj$XX[m,])
ystar <- f1d(xstar)

## plot the next chosen point
par(mfrow=c(2,1))
plot(obj, ylab="y", xlab="x", main="fitted surface")
points(xstar, ystar, col=3, pch=20)
plot(obj$XX, sqrt(obj$var), type="l", xlab="x",
     ylab="predictive sd", main="active learning")

## update the fit with (xstar, ystar)
obj <- update(obj, xstar, ystar)

## new predictive surface
obj <- predict(obj, XX, quants=FALSE)

## plotted
plot(obj, ylab="y", xlab="x", main="updated fitted surface")
plot(obj$XX, sqrt(obj$var), type="l", xlab="x",
     ylab="predictive sd", main="active learning")

## delete the cloud to prevent a memory leak
deletecloud(obj); obj$num <- NULL

## see demo("design") for more iterations and
## design under other active learning heuristics
## like ALC, and EI for optimization; also see
## demo("online") for an online learning example



