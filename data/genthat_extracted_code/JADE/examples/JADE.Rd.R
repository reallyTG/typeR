library(JADE)


### Name: JADE
### Title: JADE Algorithm for ICA
### Aliases: JADE
### Keywords: multivariate

### ** Examples

# 3 source and 3 signals

S <- cbind(rt(1000, 4), rnorm(1000), runif(1000))
A <- matrix(rnorm(9), ncol = 3)
X <- S %*% t(A)
res<-JADE(X,3)
res$A
res$W
res$S[1:10,]
(sweep(X,2,res$Xmu) %*% t(res$W))[1:10,]
round(res$W %*% A,4) 

# 2 sources and 3 signals

S2 <- cbind(rt(1000, 4), rnorm(1000)) 
A2 <- matrix(rnorm(6), ncol = 2)
X2 <- S2 %*% t(A2)
res2 <-JADE(X2,2)
res2$A
res2$W
res2$S[1:10,]
(sweep(X2,2,res2$Xmu) %*% t(res2$W))[1:10,]
SIR(S2,res2$S)



