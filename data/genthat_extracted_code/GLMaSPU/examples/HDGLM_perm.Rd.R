library(GLMaSPU)


### Name: HDGLM_perm
### Title: Resample based HDGLM test.
### Aliases: HDGLM_perm

### ** Examples


p = 200
n = 100
beta = c(1,3,3)
s = 0.15
signal.r = 0.08
seed = 2
non.zero = floor(p * s)
alpha = c(rep(signal.r,non.zero),rep(0,p-non.zero))
dat = generate_data(seed, n = n, p = p, beta = beta,alpha = alpha)
cov = dat$Z
X = dat$X
Y = dat$Y
HDGLM_perm(Y, X, cov = cov, model = "gaussian",  n.perm = 1000)




