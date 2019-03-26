library(TSstudio)


### Name: ts_quantile
### Title: Quantile Plot for Time Series
### Aliases: ts_quantile

### ** Examples


## Not run: 
##D 
##D # Loading the UKgrid package to pull a multie seasonality data
##D require(UKgrid)
##D 
##D UKgrid_half_hour <- extract_grid(type = "xts", aggregate = NULL)
##D 
##D # Plotting the quantile of the UKgrid dataset
##D # No period subset
##D ts_quantile(UKgrid_half_hour, 
##D period = NULL, 
##D title = "The UK National Grid Net Demand for Electricity - Quantile Plot")
##D  
##D # Plotting the quantile of the UKgrid dataset
##D # Using a weekday subset
##D ts_quantile(UKgrid_half_hour, 
##D period = "weekdays",
##D title = "The UK National Grid Net Demand for Electricity - by Weekdays")
##D 
##D # Spacing the plots by setting the 
##D # number of rows of the plot to 2
##D ts_quantile(UKgrid_half_hour, 
##D period = "weekdays",
##D title = "The UK National Grid Net Demand for Electricity - by Weekdays",
##D n = 2)
## End(Not run)



