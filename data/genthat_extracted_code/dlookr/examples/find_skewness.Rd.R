library(dlookr)


### Name: find_skewness
### Title: Finding skewed variables
### Aliases: find_skewness

### ** Examples

## Not run: 
##D # Generate data for the example
##D carseats <- ISLR::Carseats
##D carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
##D carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA
##D 
##D find_skewness(carseats)
##D 
##D find_skewness(carseats, index = FALSE)
##D 
##D find_skewness(carseats, thres = 0.1)
##D 
##D find_skewness(carseats, value = TRUE)
##D 
##D find_skewness(carseats, value = TRUE, thres = 0.1)
##D 
##D ## using dplyr -------------------------------------
##D library(dplyr)
##D 
##D # Perform simple data quality diagnosis of variables with outliers.
##D carseats %>%
##D   select(find_skewness(.)) %>%
##D   diagnose()
## End(Not run)



