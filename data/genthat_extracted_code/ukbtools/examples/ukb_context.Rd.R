library(ukbtools)


### Name: ukb_context
### Title: Demographics of a UKB sample subset
### Aliases: ukb_context

### ** Examples

## Not run: 
##D # Compare those with data to those without
##D ukb_context(my_ukb_data, nonmiss.var = "my_variable_of_interest")
##D 
##D # Define a subset of interest as a logical vector
##D subgroup_of_interest <- (my_ukb_data$bmi > 40 & my_ukb_data$age < 50)
##D ukb_context(my_ukb_data, subset.var = subgroup_of_interest)
## End(Not run)




