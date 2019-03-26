library(scar)


### Name: scar
### Title: Compute the maximum likelihood estimator of the generalised
###   additive regression with shape constraints
### Aliases: scar
### Keywords: classes multivariate nonparametric optimize

### ** Examples

## An example in the Poission additive regression setting:
## Define the additive function f on the scale of the predictors
f<-function(x){
  return(1*abs(x[,1]) + 2*(x[,2])^2 + 3*(abs(x[,3]))^3) 
}

## Simulate the covariates and the responses
## covariates are drawn uniformly from [-1,1]^3
set.seed(0)
d = 3
n = 500
x = matrix(runif(n*d)*2-1,nrow=n,ncol=d) 
rpoisson <- function(m){rpois(1,exp(m))}
y = sapply(f(x),rpoisson)

## All the components are convex so one can use scar
shape=c("cvx","cvx","cvx")
object = scar(x,y,shape=shape, family=poisson())

## Plot each component of the estimatied additive function
plot(object)

## Evaluate the estimated additive function at 10^4 random points 
## drawing from the interior of the support
testx = matrix((runif(10000*d)*1.96-0.98),ncol=d)
testf = predict(object,testx)

## and calculate the (estimated) absolute prediction error
mean(abs(testf-f(testx))) 



