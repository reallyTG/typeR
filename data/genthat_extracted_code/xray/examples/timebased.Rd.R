library(xray)


### Name: timebased
### Title: Analyze each variable in respect to a time variable
### Aliases: timebased

### ** Examples

library(xray)
data(longley)
longley$Year=as.Date(paste0(longley$Year,'-01-01'))
timebased(longley, 'Year')




