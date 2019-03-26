## ---- echo = FALSE, results='hide', include=FALSE------------------------
library(mdpeer)
library(glmnet)
library(ggplot2)

## ---- fig.width = 3.3, fig.height = 2.8----------------------------------
library(mdpeer)

n  <- 100
p1 <- 10
p2 <- 40
p  <- p1 + p2

# Define graph adjacency matrix
A <- matrix(rep(0, p*p), nrow = p, ncol = p)
A[1:p1, 1:p1] <- 1
A[(p1+1):p, (p1+1):p] <- 1
diag(A) <- rep(0,p)

# Compute graph Laplacian matrix 
L <- Adj2Lap(A)

vizu.mat(A, "graph adjacency matrix", 9); vizu.mat(L, "graph Laplacian matrix", 9)

## ------------------------------------------------------------------------
# simulate data objects
set.seed(1)
Z <- scale(matrix(rnorm(n*p), nrow = n, ncol = p))
X <- cbind(1, scale(matrix(rnorm(n*3), nrow = n, ncol = 3))) # cbind with 1s col. for intercept
b.true <- c(rep(1,p1), rep(0,p2)) # coefficients of interest (penalized)
beta.true <- c(0, runif(3)) # intercept=0 and 3 coefficients (non-penalized)
eta <- Z %*% b.true + X %*% beta.true
R2 <- 0.5                         # assumed variance explained 
sd.eps <- sqrt(var(eta) * (1 - R2) / R2)
error <- rnorm(n, sd = sd.eps)
y <- eta + error

## ------------------------------------------------------------------------
# estimate with riPEER 
riPEER.out   <- riPEER(Q = L, y = y, Z = Z, X = X, verbose = FALSE)
b.est.riPEER <- riPEER.out$b.est
# (graph penalty regulatization parameter, ridge penalty regularization parameter)
c(riPEER.out$lambda.Q, riPEER.out$lambda.R)

# estimate with cv.glmnet 
library(glmnet)
cv.out.glmnet <- cv.glmnet(x = cbind(X,Z), y = y, alpha = 0, intercept = FALSE)
b.est.cv.glmnet <- unlist(coef(cv.out.glmnet))[5:54] # exclude intercept and covs

## ---- echo = FALSE, fig.width=7, fig.height=3----------------------------
plt.df <- data.frame(x = rep(1:p,2), 
                     b.coef = c(b.est.riPEER,b.est.cv.glmnet),
                     est.method = c(rep("riPEER",p), rep("cv.glmnet",p)))
ggplot(plt.df, aes(x=x,y=b.coef,group=est.method, color=est.method)) + 
  geom_line(data = data.frame(x=1:p,y=b.true), aes(x=x,y=y),inherit.aes=FALSE) + 
  geom_line() + geom_point() + theme_bw(base_size = 9) + 
  labs(title = "black line: b.true", color = "estimation\nmethod")

## ------------------------------------------------------------------------
MSEr <- function(b.true, b.est) sum((b.true-b.est)^2)/sum(b.true^2)

# (riPEER error, cv.glmnet error)
c(MSEr(b.true,b.est.riPEER), MSEr(b.true,b.est.cv.glmnet))

## ------------------------------------------------------------------------
# simulate data objects
set.seed(1)
Z <- scale(matrix(rnorm(n*p), nrow = n, ncol = p))
X <- cbind(1, scale(matrix(rnorm(n*3), nrow = n, ncol = 3)))
b.true <- rep(c(-1,1), p/2)  

# coefficients of interest (penalized)
beta.true <- c(0, runif(3)) # intercept=0 and 3 coefficients (non-penalized)
eta <- Z %*% b.true + X %*% beta.true
R2 <- 0.5                         # assumed variance explained 
sd.eps <- sqrt(var(eta) * (1 - R2) / R2)
error <- rnorm(n, sd = sd.eps)
y <- eta + error

## ------------------------------------------------------------------------
# estimate with riPEER 
riPEER.out   <- riPEER(Q = L, y = y, Z = Z, X = X, verbose = FALSE)
b.est.riPEER <- riPEER.out$b.est
c(riPEER.out$lambda.Q, riPEER.out$lambda.R)

# estimate with cv.glmnet 
cv.out.glmnet <- cv.glmnet(x = cbind(X,Z), y = y, alpha = 0, intercept = FALSE)
b.est.cv.glmnet <- unlist(coef(cv.out.glmnet))[5:54] # exclude intercept and covs

## ---- echo = FALSE, fig.width=7, fig.height=3----------------------------
plt.df <- data.frame(x = rep(1:p,2), 
                     b.coef = c(b.est.riPEER,b.est.cv.glmnet),
                     est.method = c(rep("riPEER",p), rep("cv.glmnet",p)))
ggplot(plt.df, aes(x=x,y=b.coef,group=est.method, color=est.method)) + 
  geom_line(data = data.frame(x=1:p,y=b.true), aes(x=x,y=y),inherit.aes=FALSE) + 
  geom_line() + geom_point() + theme_bw(base_size = 9) + 
  labs(title = "black line: b.true", color = "estimation\nmethod")

## ------------------------------------------------------------------------
MSEr <- function(b.true, b.est) sum((b.true-b.est)^2)/sum(b.true^2)

# (riPEER error, cv.glmnet error)
c(MSEr(b.true,b.est.riPEER), MSEr(b.true,b.est.cv.glmnet))

## ------------------------------------------------------------------------
# example based on `glmnet::cv.glmnet` CRAN documentation
set.seed(1010)
n=1000;p=100
nzc=trunc(p/10)
x=matrix(rnorm(n*p),n,p)
beta=rnorm(nzc)
fx= x[,seq(nzc)] %*% beta
eps=rnorm(n)*5
y=drop(fx+eps)
set.seed(1011)
cvob1=cv.glmnet(x,y, alpha = 0)
est.cv.glmnet <- coef(cvob1)[-c(1)] # exclude intercept and covs

# use riPEERc (X has column of 1s to represent intercept in a model)
riPEERc.out <- riPEERc(Q = diag(p), y = matrix(y), Z = x, X = matrix(rep(1,n)))
est.riPEERc <- riPEERc.out$b.est

## ---- echo = FALSE, fig.width=7, fig.height=3----------------------------
plt.df <- data.frame(x = rep(1:p,2), 
                     b.coef = c(est.riPEERc,est.cv.glmnet),
                     est.method = c(rep("riPEERc",p), rep("cv.glmnet",p)))
ggplot(plt.df, aes(x=x,y=b.coef,group=est.method, color=est.method)) + 
  geom_line(data = data.frame(x=1:p,y=beta), aes(x=x,y=y),inherit.aes=FALSE) + 
  geom_line() + geom_point() + theme_bw(base_size = 9) + 
  labs(title = "black line: true", color = "estimation\nmethod")

## ------------------------------------------------------------------------
MSEr <- function(b.true, b.est) sum((b.true-b.est)^2)/sum(b.true^2)

# (riPEER error, cv.glmnet error)
c(MSEr(beta,est.riPEERc), MSEr(beta,est.cv.glmnet))

