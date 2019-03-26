library(smfsb)


### Name: StepCLE1D
### Title: Create a function for advancing the state of an SPN by using a
###   simple Euler-Maruyama discretisation of the CLE on a 1D regular grid
### Aliases: StepCLE1D
### Keywords: smfsb

### ** Examples

## No test: 
N=200
T=40
data(spnModels)
x0=matrix(0,nrow=2,ncol=N)
rownames(x0)=c("x1","x2")
x0[,round(N/2)]=LV$M
stepLV1D = StepCLE1D(LV,c(0.6,0.6),dt=0.05)
xx = simTs1D(x0,0,T,0.2,stepLV1D)
op=par(mfrow=c(1,2))
image(xx[1,,],main="Prey",xlab="Space",ylab="Time")
image(xx[2,,],main="Predator",xlab="Space",ylab="Time")
par(op)
## End(No test)



