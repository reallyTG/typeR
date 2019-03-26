library(CIEE)


### Name: traditional_regression_functions
### Title: Traditional regression approaches.
### Aliases: traditional_regression_functions mult_reg res_reg

### ** Examples


dat_GLM <- generate_data(setting = "GLM")
mult_reg(setting = "GLM", Y = dat_GLM$Y, X = dat_GLM$X, K = dat_GLM$K,
         L = dat_GLM$L)
res_reg(Y = dat_GLM$Y, X = dat_GLM$X, K = dat_GLM$K, L = dat_GLM$L)

dat_AFT <- generate_data(setting = "AFT", a = 0.2, b = 4.75)
mult_reg(setting = "AFT", Y = dat_AFT$Y, X = dat_AFT$X, K = dat_AFT$K,
         L = dat_AFT$L, C = dat_AFT$C)




