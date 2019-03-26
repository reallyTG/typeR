library(splusTimeDate)


### Name: days
### Title: Return Various Periods from a Time or Date Object
### Aliases: days weekdays months quarters years
### Keywords: chron

### ** Examples

## Creates a sample dates object of julian dates 
x <- c(10, 11, 12, 42, 44, 45, 101, 102, 212, 213, 214, 300) 
dts <- as.Date(x, origin="1960-1-1")
## Alternatively, create a sample timeDate object 
dts <- as(x, "timeDate") 
## identifies a weekday or month with each julian day 
weekdays(dts) 
months(dts) 
## Produces barplot of # of days in x appearing on particular 
## weekday or month 
# plot(weekdays(dts)) 
# plot(months(dts)) 
## Produces boxplots of julian date by weekday or month 
# plot(weekdays(dts), x) 
# plot(months(dts), x) 



