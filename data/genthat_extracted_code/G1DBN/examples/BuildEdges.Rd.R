library(G1DBN)


### Name: BuildEdges
### Title: Edges listing and evaluation
### Aliases: BuildEdges
### Keywords: utilities

### ** Examples

library(G1DBN)
## ======================================
## SIMULATING THE NETWORK

## number of genes
p <- 10
## the network - adjacency Matrix
MyNet <- SimulNetworkAdjMatrix(p,0.05,c(-1.5,-0.5,0.5,1.5))
MyNet

## ======================================
## SIMULATING THE TIME SERIES EXPERIMENTS

## number of time points
n <- 20
## initializing the B vector
B <- runif(p,-1,1)
## initializing the variance of the noise
sigmaEps <- runif(p,0.1,0.5)
## initializing the process Xt
X0 <- B + rnorm(p,0,sigmaEps*10)
## the times series process
Xn <- SimulGeneExpressionAR1(MyNet$A,B,X0,sigmaEps,n)


## ======================================
## NETWORK INFERENCE WITH G1DBN

## STEP 1 - The first step score matrix
S1 <- DBNScoreStep1(Xn, method='ls')

## Building the edges of the network inferred after Step1
alpha1 <- 0.5
G1 <- BuildEdges(S1$S1ls,threshold=alpha1,dec=FALSE)
G1
## STEP 2- The second step score matrix
S2 <- DBNScoreStep2(S1$S1ls, Xn, method='ls', alpha1)

## Building the edges of the network inferred after Step2
alpha2 <- 0.05
G2 <- BuildEdges(S2,threshold=alpha2,dec=FALSE)
G2

## Building the edges of the simulation Graph
Gsimul <- BuildEdges(MyNet$AdjMatrix,threshold=0,dec=TRUE)
Gsimul



