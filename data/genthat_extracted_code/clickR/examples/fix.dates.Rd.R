library(clickR)


### Name: fix.dates
### Title: Fix dates
### Aliases: fix.dates

### ** Examples

mydata<-data.frame(Dates1=c("25/06/1983", "25-08/2014", "2001/11/01", "2008-10-01"),
                   Dates2=c("01/01/85", "04/04/1982", "07/12-2016", NA),
                   Numeric1=rnorm(4))
fix.dates(mydata)



