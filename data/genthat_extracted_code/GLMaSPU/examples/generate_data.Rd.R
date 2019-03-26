library(GLMaSPU)


### Name: generate_data
### Title: Generate data for generalized linear models in simulation.
### Aliases: generate_data

### ** Examples


p = 200
n = 100
beta = c(1,3,3)
s = 0.15
signal.r = 0.08
non.zero = floor(p * s)
seed = 2
alpha = c(rep(signal.r,non.zero),rep(0,p-non.zero))
dat = generate_data(seed, n = n, p = p, beta = beta,alpha = alpha)
#X, Y, cov
#dat$X; dat$Y; dat$cov




