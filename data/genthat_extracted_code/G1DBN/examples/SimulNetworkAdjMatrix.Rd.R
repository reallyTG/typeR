library(G1DBN)


### Name: SimulNetworkAdjMatrix
### Title: Network object generation
### Aliases: SimulNetworkAdjMatrix
### Keywords: datagen

### ** Examples

library(G1DBN)
## number of genes
p <- 10
## the network - adjacency Matrix
MyNet <- SimulNetworkAdjMatrix(p,0.05,c(-1,0,0,1))
MyNet

## initializing the B vector
B <- runif(p,0,0.5)
## initializing the variance of the noise
sigmaEps <- runif(p,0.1,0.8)
## initializing the process Xt
X0 <- B + rnorm(p,0,sigmaEps*10)
## number of time points
n <- 20

## the AR(1) times series process
Xn <- SimulGeneExpressionAR1(MyNet$AdjMatrix,B,X0,sigmaEps,n)



