library(splusTimeDate)


### Name: timeDate
### Title: Constructor Function for timeDate Objects
### Aliases: timeDate
### Keywords: chron

### ** Examples

timeDate() 
timeDate(c("1/1/97", "2/1/97", "mar 1, 1997")) 
timeDate(c("1 PM", "2 PM", "3 AM"), in.format = "%H %p",  
      format = "%I %p") 
timeDate(julian = 36, ms = 876393,  
      in.origin = c(month=1,day=1,year=1998)) 

## Get today's date in yyyymmdd format
timeDate(date(), in.format="%w %m %d %H:%M:%S %Y",
      format="%Y%02m%02d")



