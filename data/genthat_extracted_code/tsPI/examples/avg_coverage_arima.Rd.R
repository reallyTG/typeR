library(tsPI)


### Name: avg_coverage_arima
### Title: Compute the average coverage of the prediction intervals
###   computed by naive plug-in method and 'arima_pi'
### Aliases: avg_coverage_arima

### ** Examples



## Not run: 
##D set.seed(123)
##D # takes a while, notice se, increase nsim2 to get more accurate results
##D avg_coverage_arima(phi = 0.9, n = 50, n_ahead = 10, nsim2 = 100)
##D 
##D avg_coverage_arima(phi = 0.9, theta = -0.6, n = 50, n_ahead = 10, nsim2 = 100)
## End(Not run)



