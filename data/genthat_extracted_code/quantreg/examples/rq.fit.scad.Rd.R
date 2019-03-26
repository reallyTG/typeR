library(quantreg)


### Name: rq.fit.scad
### Title: SCADPenalized Quantile Regression
### Aliases: rq.fit.scad
### Keywords: regression

### ** Examples

n <- 60
p <- 7
rho <- .5
beta <- c(3,1.5,0,2,0,0,0)
R <- matrix(0,p,p)
for(i in 1:p){
        for(j in 1:p){
                R[i,j] <- rho^abs(i-j)
                }
        }
set.seed(1234)
x <- matrix(rnorm(n*p),n,p) %*% t(chol(R))
y <- x %*% beta + rnorm(n)

f <- rq(y ~ x, method="scad",lambda = 30)
g <- rq(y ~ x, method="scad", start = "lasso", lambda = 30)



