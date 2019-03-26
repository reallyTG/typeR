library(GLMaSPU)


### Name: aSPU_apval
### Title: Asymptotic based Sum of Powered Score (SPU) tests and adaptive
###   SPU (aSPU) test.
### Aliases: aSPU_apval

### ** Examples


p = 200
n = 100
beta = c(1,3,3)
s = 0.15
non.zero = floor(p * s)
signal.r = 0.08
seed = 2
alpha = c(rep(signal.r,non.zero),rep(0,p-non.zero))
dat = generate_data(seed, n = n, p = p, beta = beta,alpha = alpha)
cov = dat$Z
X = dat$X
Y = dat$Y
aSPU_apval(Y, X, cov = cov, pow = c(1:6, Inf),resample = "perm", model = "gaussian",  n.perm = 1000)
# The p-values are similar to the resample based one




