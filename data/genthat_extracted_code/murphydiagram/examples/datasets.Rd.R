library(murphydiagram)


### Name: Data sets
### Title: Data sets with forecasts and realizations
### Aliases: inflation_mean recession_probability
### Keywords: datasets

### ** Examples


## Not run: 
##D 
##D # Load inflation forecasts
##D data(inflation_mean)
##D 
##D # Make numeric time axis
##D tm <- as.numeric(substr(inflation_mean$dt, 1, 4)) + 
##D       0.25*(as.numeric(substr(inflation_mean$dt, 6, 6))-1)
##D 
##D # Plot
##D matplot(x = tm, y = inflation_mean[,2:4], type = "l", bty = "n",
##D         xlab = "Time", ylab= "Inflation (percent)", col = 3:1)
##D legend("topright", legend = c("SPF", "Michigan", "Actual"), fill = 3:1, bty = "n")
##D 
## End(Not run)




