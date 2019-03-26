library(ftsa)


### Name: error
### Title: Forecast error measure
### Aliases: error
### Keywords: methods

### ** Examples

# Forecast error measures can be categorized into three groups: (1) scale-dependent, 
# (2) scale-independent but with possible zero denominator, 
# (3) scale-independent with non-zero denominator.
error(forecast = 1:2, true = 3:4, method = "mae")
error(forecast = 1:5, forecastbench = 6:10, true = 11:15, method = "mrae")
error(forecast = 1:5, forecastbench = 6:10, true = 11:15, insampletrue = 16:20, 
	giveall = TRUE)



