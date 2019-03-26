library(smfsb)


### Name: simTs2D
### Title: Simulate a model on a regular grid of times, using a function
###   (closure) for advancing the state of the model
### Aliases: simTs2D
### Keywords: smfsb

### ** Examples

## No test: 
data(spnModels)
m=20; n=30; T=15
x0=array(0,c(2,m,n))
dimnames(x0)[[1]]=c("x1","x2")
x0[,round(m/2),round(n/2)]=LV$M
stepLV2D = StepGillespie2D(LV,c(0.6,0.6))
xx = simTs2D(x0,0,T,0.2,stepLV2D,verb=TRUE)
N = dim(xx)[4]
op=par(mfrow=c(1,2))
image(xx[1,,,N],main="Prey",xlab="Space",ylab="Time")
image(xx[2,,,N],main="Predator",xlab="Space",ylab="Time")
par(op)
## End(No test)


