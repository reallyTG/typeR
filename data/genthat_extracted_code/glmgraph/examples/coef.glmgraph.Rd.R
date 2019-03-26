library(glmgraph)


### Name: coef.glmgraph
### Title: Retrieve coefficients from a fitted "glmgraph" object.
### Aliases: coef.glmgraph
### Keywords: models regression

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
 btrue <- c(rep(magnitude,p1),rep(0,p2))
 intercept <- 0
 eta <- intercept+X%*%btrue
 diagL <- apply(A,1,sum)
 L <- -A
 diag(L) <- diagL
 ### gaussian
 Y <- eta+rnorm(n)
 obj <- glmgraph(X,Y,L)
 coefs <- coef(obj)
 coefs <- coef(obj,lambda2=0.01)
 coefs <- coef(obj,lambda1=c(0.11,0.12))
 coefs <- coef(obj,lambda1=c(0.11,0.12),lambda2=0.01)



