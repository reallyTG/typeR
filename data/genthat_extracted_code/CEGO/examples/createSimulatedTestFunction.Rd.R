library(CEGO)


### Name: createSimulatedTestFunction
### Title: Simulation-based Test Function Generator, Object Interface
### Aliases: createSimulatedTestFunction

### ** Examples

nsim <- 10
seed <- 12345
n <- 6
set.seed(seed)
#target function:
fun <- function(x){
  exp(-20* x) + sin(6*x^2) + x
}
# "vectorize" target
f <- function(x){sapply(x,fun)}
# distance function
dF <- function(x,y)(sum((x-y)^2)) #sum of squares 
#start pdf creation
# plot params
par(mfrow=c(4,1),mar=c(2.3,2.5,0.2,0.2),mgp=c(1.4,0.5,0))
#test samples for plots
xtest <- as.list(seq(from=-0,by=0.005,to=1))
plot(xtest,f(xtest),type="l",xlab="x",ylab="Obj. function")
#evaluation samples (training)
xb <- as.list(runif(n)) 
yb <- f(xb)
# support samples for simulation
x <- as.list(sort(c(runif(100),unlist(xb))))
# fit the model	
fit <- modelKriging(xb,yb,dF,control=list(
   algThetaControl=list(method="NLOPT_GN_DIRECT_L",funEvals=100),useLambda=FALSE))
fit
#predicted obj. function values
ypred <- predict(fit,as.list(xtest))$y
plot(unlist(xtest),ypred,type="l",xlab="x",ylab="Estimation")
points(unlist(xb),yb,pch=19)
##############################	
# create test function non conditional
##############################
fun <- createSimulatedTestFunction(x,fit,nsim,FALSE,seed=1)
ynew <- NULL
for(i in 1:nsim)
  ynew <- cbind(ynew,fun[[i]](xtest))
rangeY <- range(ynew)
plot(unlist(xtest),ynew[,1],type="l",ylim=rangeY,xlab="x",ylab="Simulation")
for(i in 2:nsim){
  lines(unlist(xtest),ynew[,i],col=i,type="l")
}
##############################	
# create test function conditional
##############################
fun <- createSimulatedTestFunction(x,fit,nsim,TRUE,seed=1)
ynew <- NULL
for(i in 1:nsim)
  ynew <- cbind(ynew,fun[[i]](xtest))
rangeY <- range(ynew)
plot(unlist(xtest),ynew[,1],type="l",ylim=rangeY,xlab="x",ylab="Conditional sim.")
for(i in 2:nsim){
  lines(unlist(xtest),ynew[,i],col=i,type="l")
}
points(unlist(xb),yb,pch=19)
dev.off()




