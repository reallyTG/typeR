library(simest)


### Name: simestgcv
### Title: Single Index Model Estimation: Objective Function Approach.
### Aliases: simestgcv simestgcv.default
### Keywords: Single Index Model Penalized Least Squares

### ** Examples

args(sim.est)
x <- matrix(runif(20*2,-1,1),ncol = 2)
b0 <- rep_len(1,2)/sqrt(2)
y <- (x%*%b0)^2 + rnorm(20,0,0.3)
tmp2 <- simestgcv(x, y, lambda = c(20^{1/6}, 20^{1/4}), nmulti = 1, 
					agcv.iter = 10, maxit = 10, beta.tol = 1e-03)
print(tmp2)
plot(tmp2)
predict(tmp2, newdata = c(0,0))



