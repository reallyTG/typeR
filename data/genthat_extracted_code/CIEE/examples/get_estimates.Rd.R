library(CIEE)


### Name: get_estimates
### Title: CIEE parameter point estimates
### Aliases: get_estimates

### ** Examples


dat_GLM <- generate_data(setting = "GLM")
get_estimates(setting = "GLM", Y = dat_GLM$Y, X = dat_GLM$X, K = dat_GLM$K,
              L = dat_GLM$L)

dat_AFT <- generate_data(setting = "AFT", a = 0.2, b = 4.75)
get_estimates(setting = "AFT", Y = dat_AFT$Y, X = dat_AFT$X, K = dat_AFT$K,
              L = dat_AFT$L, C = dat_AFT$C)




