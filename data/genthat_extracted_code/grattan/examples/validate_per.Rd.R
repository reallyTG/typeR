library(grattan)


### Name: validate_per
### Title: Validate per
### Aliases: validate_per

### ** Examples

## Not run: 
##D # Typical use-case
##D # attach(asNamespace("grattan"))
##D z <- function(per = "year") 52 / validate_per(per, missing(per))
##D z()  # message
##D z(per = "year")       # same, no message
##D z(per = "fortnight")  # in fortnights
##D z(per = "sidfh")      # error
## End(Not run)





