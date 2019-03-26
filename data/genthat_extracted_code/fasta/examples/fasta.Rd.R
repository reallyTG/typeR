library(fasta)


### Name: fasta
### Title: Fast Adaptive Shrinkage/Thresholding Algorithm
### Aliases: fasta

### ** Examples


#------------------------------------------------------------------------
# LEAST SQUARES: EXAMPLE 1 (SIMULATED DATA)
#------------------------------------------------------------------------

set.seed(12345)
n <- 100
p <- 25
X <- matrix(rnorm(n*p),n,p)
beta <- matrix(rnorm(p),p,1)
y <- X%*%beta + rnorm(n)
beta0 <- matrix(0,p,1) # initial starting vector

f <- function(beta){ 0.5*norm(X%*%beta - y, "F")^2 }
gradf <- function(beta){ t(X)%*%(X%*%beta - y) }
g <- function(beta) { 0 }
proxg <- function(beta, tau) { beta }
x0 <- double(p) # initial starting iterate
tau1 <- 10

sol <- fasta(f,gradf,g,proxg,x0,tau1)
# Check KKT conditions
gradf(sol$x)

#------------------------------------------------------------------------
# LASSO LEAST SQUARES: EXAMPLE 2 (SIMULATED DATA)
#------------------------------------------------------------------------

set.seed(12345)
n <- 100
p <- 25
X <- matrix(rnorm(n*p),n,p)
beta <- matrix(rnorm(p),p,1)
y <- X%*%beta + rnorm(n)
beta0 <- matrix(0,p,1) # initial starting vector
lambda <- 10

f <- function(beta){ 0.5*norm(X%*%beta - y, "F")^2 }
gradf <- function(beta){ t(X)%*%(X%*%beta - y) }
g <- function(beta) { lambda*norm(as.matrix(beta),'1') }
proxg <- function(beta, tau) { sign(beta)*(sapply(abs(beta) - tau*lambda,
  FUN=function(x) {max(x,0)})) }
x0 <- double(p) # initial starting iterate
tau1 <- 10

sol <- fasta(f,gradf,g,proxg,x0,tau1)
# Check KKT conditions
cbind(sol$x,t(X)%*%(y-X%*%sol$x)/lambda)

#------------------------------------------------------------------------
# LOGISTIC REGRESSION: EXAMPLE 3 (SIMLUATED DATA)
#------------------------------------------------------------------------

set.seed(12345)
n <- 100
p <- 25
X <- matrix(rnorm(n*p),n,p)
y <- sample(c(0,1),nrow(X),replace=TRUE)
beta <- matrix(rnorm(p),p,1)
beta0 <- matrix(0,p,1) # initial starting vector
f <- function(beta) { -t(y)%*%(X%*%beta) + sum(log(1+exp(X%*%beta))) } # objective function
gradf <- function(beta) { -t(X)%*%(y-plogis(X%*%beta)) } # gradient
g <- function(beta) { 0 }
proxg <- function(beta, tau) { beta }
x0 <- double(p) # initial starting iterate
tau1 <- 10

sol <- fasta(f,gradf,g,proxg,x0,tau1)
# Check KKT conditions
gradf(sol$x)

#------------------------------------------------------------------------
# LASSO LOGISTIC REGRESSION: EXAMPLE 4 (SIMLUATED DATA)
#------------------------------------------------------------------------

set.seed(12345)
n <- 100
p <- 25
X <- matrix(rnorm(n*p),n,p)
y <- sample(c(0,1),nrow(X),replace=TRUE)
beta <- matrix(rnorm(p),p,1)
beta0 <- matrix(0,p,1) # initial starting vector
lambda <- 5

f <- function(beta) { -t(y)%*%(X%*%beta) + sum(log(1+exp(X%*%beta))) } # objective function
gradf <- function(beta) { -t(X)%*%(y-plogis(X%*%beta)) } # gradient
g <- function(beta) { lambda*norm(as.matrix(beta),'1') }
proxg <- function(beta, tau) { sign(beta)*(sapply(abs(beta) - tau*lambda,
  FUN=function(x) {max(x,0)})) }
x0 <- double(p) # initial starting iterate
tau1 <- 10

sol <- fasta(f,gradf,g,proxg,x0,tau1)
# Check KKT conditions
cbind(sol$x,-gradf(sol$x)/lambda)



