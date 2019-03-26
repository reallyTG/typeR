library(glmgraph)


### Name: predict.glmgraph
### Title: Model predictions based on a fitted "glmgraph" object.
### Aliases: predict.glmgraph predict.glmgraph
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
 res <- predict(obj, X, type="link", lambda1=0.05,lambda2=0.01)
 res <- predict(obj, X, type="response", lambda1=0.05,lambda2=0.01)
 res <- predict(obj,X,type="nzeros",lambda1=0.05,lambda2=0.01)
 ### binomial
 Y <- rbinom(n,1,prob=1/(1+exp(-eta)))
 obj <- glmgraph(X,Y,L,family="binomial")
 res <- predict(obj,X,type="class",lambda1=c(0.05,0.06),lambda2=c(0.02,0.16,0.32))



