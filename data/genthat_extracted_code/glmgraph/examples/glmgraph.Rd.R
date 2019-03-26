library(glmgraph)


### Name: glmgraph
### Title: Fit a GLM with a combination of sparse and smooth regularization
### Aliases: glmgraph
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
 A <- matrix(rep(0,p*p),p,p)
 A[1:p1,1:p1] <- 1
 A[(p1+1):p,(p1+1):p] <- 1
 diag(A) <- 0
 btrue <- c(rep(magnitude,p1),rep(0,p2))
 intercept <- 0
 eta <- intercept+X%*%btrue
 ### construct laplacian matrix from adjacency matrix
 diagL <- apply(A,1,sum)
 L <- -A
 diag(L) <- diagL
 ### gaussian
 Y <- eta+rnorm(n)
 obj <- glmgraph(X,Y,L,family="gaussian")
 plot(obj)
 ### binomial
 Y <- rbinom(n,1,prob=1/(1+exp(-eta)))
 obj <- glmgraph(X,Y,L,family="binomial")
 plot(obj) 
 



