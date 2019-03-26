library(scar)


### Name: scair
### Title: Maximizing the likelihood of the generalised additive index
###   model with shape constraints
### Aliases: scair
### Keywords: classes index multivariate nonparametric optimize

### ** Examples


## An example in the Gaussian additive index regression setting:
## Define the additive function f on the scale of the predictors
f<-function(x){
  return((0.5*x[,1]+0.25*x[,2]-0.25*x[,3])^2) 
}

## Simulate the covariates and the responses
## covariates are drawn uniformly from [-1,1]^3
set.seed(10)
d = 3
n = 500
x = matrix(runif(n*d)*2-1,nrow=n,ncol=d) 
y = f(x) + rnorm(n,sd=0.5)

## Single index model so no delta is required here
shape=c("cvx")
object = scair(x,y,shape=shape, family=gaussian(),iter = 100)

## Estimated index matrix
object$index

## Root squared error for the estimated index
sqrt(sum((object$index - c(0.5,0.25,-0.25))^2))

## Plot the estimatied additive function for the single index
plot(object)

## Evaluate the estimated prediction function at 10^4 random points 
## drawing from the interior of the support
testx = matrix((runif(10000*d)*1.96-0.98),ncol=d)
testf = predict(object,testx)

## and calculate the (estimated) absolute prediction error
mean(abs(testf-f(testx))) 

## Here we can treat the obtained index matrix as a warm start and perform 
## further optimization (on the second and third entry of the index)
## using e.g. the default R optimisation routine.
fn<-function(w){
    dev = Inf
    if (abs(w[1])+abs(w[2])>1) return(dev)
    else {
      wnew = matrix(c(1-abs(w[1])-abs(w[2]),w[1],w[2]),ncol=1)
      dev = scar(x %*% wnew, y, shape = "cvx")$deviance
      return (dev)
    } 
}
index23 = optim(object$index[2:3],fn)$par
newindex = matrix(c(1-sum(abs(index23)),index23),ncol=1); newindex

## Root squared error for the new estimated index
sqrt(sum((newindex - c(0.5,0.25,-0.25))^2))

## A further example is provided in decathlon dataset




