library(dint)


### Name: is_quarter_bounds
### Title: Useful Predicates for Dates
### Aliases: is_quarter_bounds is_first_of_quarter is_last_of_quarter
###   is_year_bounds is_first_of_year is_last_of_year is_Date is_POSIXlt

### ** Examples

x <- as.Date(c("2018-01-01", "2018-03-31", "2018-02-14"))
is_first_of_year(x)
is_first_of_quarter(x)
is_last_of_quarter(x)
is_quarter_bounds(x[[1]], x[[2]])
is_quarter_bounds(x[[2]], x[[3]])




