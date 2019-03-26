library(validate)


### Name: errors
### Title: Get messages from a confrontation object
### Aliases: errors errors,confrontation-method
###   warnings,confrontation-method

### ** Examples


# create an error, by using a non-existent variable name
cf <- check_that(women, hite > 0, weight > 0)
# retrieve error messages
errors(cf)





