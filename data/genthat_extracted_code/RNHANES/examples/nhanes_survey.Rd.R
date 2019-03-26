library(RNHANES)


### Name: nhanes_survey
### Title: Apply a function from the survey package to NHANES data
### Aliases: nhanes_survey

### ** Examples

## Not run: 
##D library(survey)
##D 
##D nhanes_data <- nhanes_load_data("EPH", "2011-2012", demographics = TRUE)
##D 
##D # Compute the mean of triclosan using the svymean function
##D nhanes_survey(svymean, nhanes_data, "URXTRS", "URDTRSLC", na.rm = TRUE)
##D 
##D # Compute the variance using svyvar
##D nhanes_survey(svyvar, nhanes_data, "URXTRS", "URDTRSLC", na.rm = TRUE)
##D 
## End(Not run)




