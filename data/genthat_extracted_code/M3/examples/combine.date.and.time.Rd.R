library(M3)


### Name: combine.date.and.time
### Title: Combine date and time to obtain date-time in POSIX format
### Aliases: combine.date.and.time
### Keywords: chron

### ** Examples

## This function can accept dates as a character string:
combine.date.and.time(date="2011-05-03", time="16:15:30")

## Or, the dates can be in R's Date format.
combine.date.and.time(date=as.Date("2011-05-03"), time="16:15:30")

## The time can also be given as a list:
combine.date.and.time(date="2011-05-03", time=list(hrs=16, mins=15, secs=30))



