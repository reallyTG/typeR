library(smfsb)


### Name: StepCLE2D
### Title: Create a function for advancing the state of an SPN by using a
###   simple Euler-Maruyama discretisation of the CLE on a 2D regular grid
### Aliases: StepCLE2D
### Keywords: smfsb

### ** Examples

## No test: 
m=150
n=100
T=15
data(spnModels)
x0=array(0,c(2,m,n))
dimnames(x0)[[1]]=c("x1","x2")
x0[,round(m/2),round(n/2)]=LV$M
stepLV2D = StepCLE2D(LV,c(0.6,0.6),dt=0.05)
xx = simTs2D(x0,0,T,0.5,stepLV2D,verb=TRUE)
N = dim(xx)[4]
op=par(mfrow=c(1,2))
image(xx[1,,,N],main="Prey",xlab="Space",ylab="Time")
image(xx[2,,,N],main="Predator",xlab="Space",ylab="Time")
par(op)
## End(No test)



