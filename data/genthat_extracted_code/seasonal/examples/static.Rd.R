library(seasonal)


### Name: static
### Title: Static Call of a seas Object
### Aliases: static

### ** Examples

## Not run: 
##D 
##D m <- seas(AirPassengers)
##D getCall(m)                   # default call
##D static(m)                    # static call
##D static(m, test = FALSE)      # much faster
##D static(m, evaluate = TRUE)   # returns an object of class "seas"
##D 
##D m <- seas(AirPassengers, x11 = "")
##D 
##D static(m, x11.filter = TRUE) # also fixes the X-11 filter (with a warning)
##D static(m, coef = TRUE)       # also fixes the coefficients
## End(Not run)



