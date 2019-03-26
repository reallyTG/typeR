library(splusTimeDate)


### Name: timeConvert
### Title: Convert from one time zone to another.
### Aliases: timeConvert
### Keywords: chron

### ** Examples

timeDateOptions(time.zone="GMT",
  time.in.format="%m/%d/%Y [%H:%M]",
  time.out.format="%m/%d/%Y %02H:%02M (%Z)")
date1 <- timeDate("3/22/2002 12:00", zone="PST")
date1 
## 3/22/2002 12:00 (PST)
date2 <- timeConvert(date1, "EST")
date2 # converted to EST
## 3/22/2002 15:00 (EST)



