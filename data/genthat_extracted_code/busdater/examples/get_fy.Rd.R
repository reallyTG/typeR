library(busdater)


### Name: get_fy
### Title: Get a financial year.
### Aliases: get_fy

### ** Examples

get_fy() ## return the current financial year as integer

dt <- as.Date(c("01-01-2018", "15-12-2017"), "%d-%m-%Y")
get_fy(date = dt[1])
get_fy(date = dt)

get_fy(offset_period = 1) ## return the next financial year as integer
get_fy(date = dt[1], offset_period = 1)
get_fy(date = dt, offset_period = 1)

get_fy(offset_period=-1) ## return the previous financial year as integer
get_fy(date = dt[1], offset_period = -1)
get_fy(date = dt, offset_period = -1)


## Not run: 
##D get_fy("a") ## will fail because dates are expected.
## End(Not run)



