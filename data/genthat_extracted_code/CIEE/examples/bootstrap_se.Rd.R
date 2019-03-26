library(CIEE)


### Name: bootstrap_se
### Title: Bootstrap standard error estimates
### Aliases: bootstrap_se

### ** Examples


dat <- generate_data(setting = "GLM", n = 100)

# For illustration use here only 100 bootstrap samples, recommended is using 1000
bootstrap_se(setting = "GLM", BS_rep = 100, Y = dat$Y, X = dat$X,
             K = dat$K, L = dat$L)




