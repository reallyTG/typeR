library(glmgraph)


### Name: cv.glmgraph
### Title: Cross-validation for glmgraph
### Aliases: cv.glmgraph

### ** Examples

 set.seed(1234)
 library(glmgraph)
 n <- 100
 p1 <- 10
 p2 <- 90
 p <- p1+p2
 X <- matrix(rnorm(n*p), n,p)
 magnitude <- 1
 ## construct laplacian matrix from adjacency matrix
 A <- matrix(rep(0,p*p),p,p)
 A[1:p1,1:p1] <- 1
 A[(p1+1):p,(p1+1):p] <- 1
 diag(A) <- 0
 diagL <- apply(A,1,sum)
 L <- -A
 diag(L) <- diagL
 btrue <- c(rep(magnitude,p1),rep(0,p2))
 intercept <- 0
 eta <- intercept+X%*%btrue
 ### gaussian
 Y <- eta+rnorm(n)
 cv.obj <- cv.glmgraph(X,Y,L,penalty="lasso",lambda2=c(0,1.28))
 beta.min <- coef(cv.obj)
 print(cv.obj)
 ### binomial
 Y <- rbinom(n,1,prob=1/(1+exp(-eta)))
 cv.obj <- cv.glmgraph(X,Y,L,family="binomial",lambda2=c(0,1.28),penalty="lasso",type.measure="auc")
 beta.min <- coef(cv.obj)
 print(cv.obj)



