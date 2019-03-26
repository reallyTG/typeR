library(glmgraph)


### Name: glmgraph-package
### Title: Fit a GLM with a combination of sparse and smooth regularization
### Aliases: glmgraph-package
### Keywords: models regression package

### ** Examples

 set.seed(1234)
 library(glmgraph)
 n <- 100
 p1 <- 10
 p2 <- 90
 p <- p1+p2
 X <- matrix(rnorm(n*p), n,p)
 magnitude <- 1
 ## Construct Adjacency and Laplacian matrices
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
 Y <- eta+rnorm(n)
 obj <- glmgraph(X,Y,L,family="gaussian")
 plot(obj)
 betas <- coef(obj)
 betas <- coef(obj,lambda1=c(0.1,0.2))
 yhat <- predict(obj,X,type="response")
 cv.obj <- cv.glmgraph(X,Y,L)
 plot(cv.obj)
 beta.min <- coef(cv.obj)
 yhat.min <- predict(cv.obj,X)
 



