library(KFAS)


### Name: KFS
### Title: Kalman Filter and Smoother with Exact Diffuse Initialization for
###   Exponential Family State Space Models
### Aliases: KFS

### ** Examples

set.seed(1)
x <- cumsum(rnorm(100, 0, 0.1))
y <- rnorm(100, x, 0.1)
model <- SSModel(y ~ SSMtrend(1, Q = 0.01), H = 0.01)
out <- KFS(model)
ts.plot(ts(x), out$a, out$att, out$alpha, col = 1:4)




