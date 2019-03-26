library(dlookr)


### Name: find_outliers
### Title: Finding variables including outliers
### Aliases: find_outliers

### ** Examples

## Not run: 
##D # Generate data for the example
##D carseats <- ISLR::Carseats
##D carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
##D carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA
##D 
##D find_outliers(carseats)
##D 
##D find_outliers(carseats, index = FALSE)
##D 
##D find_outliers(carseats, rate = TRUE)
##D 
##D ## using dplyr -------------------------------------
##D library(dplyr)
##D 
##D # Perform simple data quality diagnosis of variables with outliers.
##D carseats %>%
##D   select(find_outliers(.)) %>%
##D   diagnose()
## End(Not run)



