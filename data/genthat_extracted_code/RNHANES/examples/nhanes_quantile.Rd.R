library(RNHANES)


### Name: nhanes_quantile
### Title: Compute quantiles from NHANES weighted survey data
### Aliases: nhanes_quantile

### ** Examples


## Not run: 
##D dat <- nhanes_load_data("UHG_G", "2011-2012", demographics = TRUE)
##D 
##D # Compute 50th, 95th, and 99th quantiles
##D nhanes_quantile(dat, "URXUHG", "URDUHGLC", "WTSA2YR", c(0.5, 0.95, 0.99))
## End(Not run)




