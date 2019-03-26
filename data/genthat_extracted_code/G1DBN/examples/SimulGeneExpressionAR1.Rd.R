library(G1DBN)


### Name: SimulGeneExpressionAR1
### Title: First order multivariate Auto-Regressive time series generation
### Aliases: SimulGeneExpressionAR1
### Keywords: datagen ts

### ** Examples

library(G1DBN)
## number of genes
p <- 20
## the network - adjacency Matrix
MyNet <- SimulNetworkAdjMatrix(p,0.05,c(-1,0,0,1))

## initializing the B vector
B <- runif(p,0,0.5)
## initializing the variance of the noise
sigmaEps <- runif(p,0.1,0.8)
## initializing the process Xt
X0 <- B + rnorm(p,0,sigmaEps*10)
## number of time points
n <- 30

## the AR(1) time series process
Xn <- SimulGeneExpressionAR1(MyNet$A,B,X0,sigmaEps,n)

plot(1:n, Xn[,1],type="l", xlab="Time t", ylab="X(t)",
main="Simulated AR(1) time series", ylim=c(min(Xn),max(Xn)))

for (i in 2:p){
  lines(1:n,Xn[,i],col=i)
}




