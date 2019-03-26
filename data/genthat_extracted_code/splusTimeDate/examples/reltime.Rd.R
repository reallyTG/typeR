library(splusTimeDate)


### Name: timeRelative
### Title: Constructor Function for timeRelative Class
### Aliases: timeRelative
### Keywords: chron

### ** Examples

# Create a relative time object that you could add to a time/date object
# to take each element to the third Friday of the month
rtobj <- timeRelative("-a0mth -1fri +3fri")
timeDate(c("1/5/1998", "2/26/1998"), format = "%a %m/%d/%Y") + rtobj
# Create a relative time object for 3 minutes
timeRelative(by="minutes", k.by=3)



