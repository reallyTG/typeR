library(simest)


### Name: sim.est
### Title: Single Index Model Estimation: Objective Function Approach.
### Aliases: sim.est sim.est.default print.sim.est plot.sim.est
###   predict.sim.est
### Keywords: Single Index Model Penalized Least Squares

### ** Examples

args(sim.est)
x <- matrix(runif(50*3,-1,1),ncol = 3)
b0 <- rep_len(1,3)/sqrt(3)
y <- (x%*%b0)^2 + rnorm(50,0,0.3)
tmp1 <- sim.est(x, y, lambda = 0.01, method = "cvx.pen", nmulti = 5)
tmp3 <- sim.est(x, y, lambda = 0.01, method = "smooth.pen", nmulti = 5)
print(tmp1)
print(tmp3)
plot(tmp1)
plot(tmp3)
predict(tmp1, newdata = c(0,0,0))
predict(tmp3, newdata = c(0,0,0))



