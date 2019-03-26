library(splusTimeDate)


### Name: timeZoneConvert
### Title: Convert Time Zones
### Aliases: timeZoneConvert
### Keywords: chron

### ** Examples

timeDateOptions(time.zone="GMT",
  time.in.format="%m/%d/%Y [%H:%M]",
  time.out.format="%m/%d/%Y %02H:%02M (%Z)")
date1 <- timeDate("3/22/2002 12:00", zone="GMT")
date1 
# 3/22/2002 12:00 (GMT)
date2 <- timeZoneConvert(date1, "PST")
date2 # appears the same as date1, except for zone
# 3/22/2002 12:00 (PST)
date1 - date2 # these times are 8 hours apart

# modifying the time.zone slot does not change
# the actual time, just the display
date3 <- date2
date3@time.zone <- "EST"
date3 # displays as 3 hours later
# 3/22/2002 15:00 (EST)
date2-date3 # but the difference is zero
# 0d 0h 0m 0s 0MS



