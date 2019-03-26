library(ssfa)


### Name: ssfa
### Title: Spatial stochastic frontier estimation
### Aliases: ssfa ssfa.fit

### ** Examples

library(ssfa) 
data(SSFA_example_data)
data(Italian_W)
ssfa <- ssfa(log_y ~ log_x, data = SSFA_example_data, 
             data_w=Italian_W, form = "production", par_rho=TRUE)

### SSFA total variance decomposition 
sigma2 = ssfa$sigmau2_dmu + ssfa$sigmau2_sar + ssfa$sigmav2
sigma2
ssfa$sigma2



