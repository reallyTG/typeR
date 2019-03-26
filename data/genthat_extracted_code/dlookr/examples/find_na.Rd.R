library(dlookr)


### Name: find_na
### Title: Finding variables including missing values
### Aliases: find_na

### ** Examples

## Not run: 
##D # Generate data for the example
##D carseats <- ISLR::Carseats
##D carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
##D carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA
##D 
##D find_na(carseats)
##D 
##D find_na(carseats, index = FALSE)
##D 
##D find_na(carseats, rate = TRUE)
##D 
##D ## using dplyr -------------------------------------
##D library(dplyr)
##D 
##D # Perform simple data quality diagnosis of variables with missing values.
##D carseats %>%
##D   select(find_na(.)) %>%
##D   diagnose()
## End(Not run)



