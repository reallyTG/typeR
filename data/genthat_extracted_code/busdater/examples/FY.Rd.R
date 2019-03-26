library(busdater)


### Name: FY
### Title: Get a financial year (deprecated).
### Aliases: FY

### ** Examples

FY() # deprecated function returns the current financial year as integer

dt <- as.Date(c("01-01-2018", "15-12-2017"), "%d-%m-%Y")
FY(date = dt[1])
FY(date = dt)

FY(offset_period = 1) ## return the next financial year as integer
FY(date = dt[1], offset_period = 1)
FY(date = dt, offset_period = 1)

FY(offset_period=-1) ## return the previous financial year as integer
FY(date = dt[1], offset_period = -1)
FY(date = dt, offset_period = -1)


## Not run: 
##D FY("a") ## will fail because dates are expected.
## End(Not run)





