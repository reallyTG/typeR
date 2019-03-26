library(smfsb)


### Name: StepGillespie1D
### Title: Create a function for advancing the state of an SPN by using the
###   Gillespie algorithm on a 1D regular grid
### Aliases: StepGillespie1D
### Keywords: smfsb

### ** Examples

## No test: 
data(spnModels)
N=20; T=30
x0=matrix(0,nrow=2,ncol=N)
rownames(x0)=c("x1","x2")
x0[,round(N/2)]=LV$M
stepLV1D = StepGillespie1D(LV,c(0.6,0.6))
xx = simTs1D(x0,0,T,0.2,stepLV1D,verb=TRUE)
op=par(mfrow=c(1,2))
image(xx[1,,],main="Prey",xlab="Space",ylab="Time")
image(xx[2,,],main="Predator",xlab="Space",ylab="Time")
par(op)
## End(No test)



