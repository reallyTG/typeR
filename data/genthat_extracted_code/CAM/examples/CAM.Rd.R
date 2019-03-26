library(CAM)


### Name: CAM
### Title: Causal Additive Model
### Aliases: CAM
### Keywords: Causality Regression Additive Noise Models Restricted
###   Structural Equation Model

### ** Examples

n <- 500
eps1<-rnorm(n)
eps2<-rnorm(n)
eps3<-rnorm(n)
eps4<-rnorm(n)

x2 <- 0.5*eps2
x1 <- 0.9*sign(x2)*(abs(x2)^(0.5))+0.5*eps1
x3 <- 0.8*x2^2+0.5*eps3
x4 <- -0.9*sin(x3) - abs(x1) + 0.5*eps4

X <- cbind(x1,x2,x3,x4)

trueDAG <- cbind(c(0,1,0,0),c(0,0,0,0),c(0,1,0,0),c(1,0,1,0))
## x4 <- x3 <- x2 -> x1 -> x4
## adjacency matrix:
## 0 0 0 1
## 1 0 1 0
## 0 0 0 1
## 0 0 0 0

estDAG <- CAM(X, scoreName = "SEMGAM", numCores = 1, output = TRUE, variableSel = FALSE, 
              pruning = TRUE, pruneMethod = selGam, pruneMethodPars = list(cutOffPVal = 0.001))

cat("true DAG:\n")
show(trueDAG)

cat("estimated DAG:\n")
show(estDAG$Adj)



