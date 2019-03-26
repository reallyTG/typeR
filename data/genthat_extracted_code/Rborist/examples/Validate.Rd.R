library(Rborist)


### Name: Validate
### Title: Separate Validation of Trained Decision Forest
### Aliases: Validate Validate.default

### ** Examples

## Not run: 
##D     ## Trains without validation.
##D     rb <- Rborist(x, y, noValidate=TRUE)
##D     ...
##D     ## Delayed validation using a PreFormat object.
##D     pf <- PreFormat(x)
##D     v <- Validate(pf, rb, y)
##D   
## End(Not run)



