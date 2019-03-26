library(pgirmess)


### Name: date2winter
### Title: Convert a POSIXt date into categories corresponding to a
###   autumn/winter/spring sequence
### Aliases: date2winter
### Keywords: misc

### ** Examples

 dates <- strptime(c("02/12/2002", "15/01/2003","15/10/2003","15/6/2003",NA),"%d/%m/%Y")
 date2winter(dates)



