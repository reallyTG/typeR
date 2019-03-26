library(ssfa)


### Name: plot_fitted
### Title: SSFA plot
### Aliases: plot_fitted

### ** Examples


library(ssfa) 
data(SSFA_example_data)
data(Italian_W)

#### SFA and SSFA comparison 
sfa <- ssfa(log_y ~ log_x, data = SSFA_example_data, data_w=Italian_W, 
             form = "production", par_rho=FALSE)
ssfa <- ssfa(log_y ~ log_x, data = SSFA_example_data, data_w=Italian_W, 
 form = "production", par_rho=TRUE)

sfa_fitted <- fitted.ssfa(sfa)
plot_fitted(SSFA_example_data$log_x, SSFA_example_data$log_y, ssfa)
lines(sort(SSFA_example_data$log_x), sfa_fitted[order(SSFA_example_data$log_x)],col="red")



