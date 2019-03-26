library(ssfa)


### Name: plot_moran
### Title: SSFA residuals Moran plot
### Aliases: plot_moran

### ** Examples


library(ssfa) 
data(SSFA_example_data)
data(Italian_W)

#### SFA and SSFA comparison ###
sfa <- ssfa(log_y ~ log_x, data = SSFA_example_data, data_w=Italian_W, 
             form = "production", par_rho=FALSE)
ssfa <- ssfa(log_y ~ log_x, data = SSFA_example_data, data_w=Italian_W, 
             form = "production", par_rho=TRUE)

moran.test(residuals.ssfa(sfa), sfa$list_w)
moran.test(residuals.ssfa(ssfa), ssfa$list_w)

plot_moran(sfa, listw=sfa$list_w)
plot_moran(ssfa, listw=ssfa$list_w)



