library(CIEE)


### Name: naive_se
### Title: Naive standard error estimates
### Aliases: naive_se

### ** Examples


dat <- generate_data(setting = "GLM")
naive_se(setting = "GLM", Y = dat$Y, X = dat$X, K = dat$K, L = dat$L)




