library(lubridate)


### Name: quarter
### Title: Get the fiscal quarter and semester of a date-time
### Aliases: quarter semester

### ** Examples

x <- ymd(c("2012-03-26", "2012-05-04", "2012-09-23", "2012-12-31"))
quarter(x)
quarter(x, with_year = TRUE)
quarter(x, with_year = TRUE, fiscal_start = 11)
semester(x)
semester(x, with_year = TRUE)



