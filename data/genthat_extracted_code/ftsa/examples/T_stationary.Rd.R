library(ftsa)


### Name: T_stationary
### Title: Testing stationarity of functional time series
### Aliases: T_stationary
### Keywords: models

### ** Examples

result = T_stationary(sample = pm_10_GR_sqrt$y)
result_pivotal = T_stationary(sample = pm_10_GR_sqrt$y, J = 100, MC_rep = 5000, 
				h = 20, pivotal = TRUE)



