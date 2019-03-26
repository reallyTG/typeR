library(splusTimeDate)


### Name: timeZoneList
### Title: Time Zone List
### Aliases: timeZoneList
### Keywords: chron

### ** Examples

# return the entire time zone list 
timeZoneList() 
# define the string "PDT8PST" to mean US Pacific time 
timeZoneList(PDT8PST = timeZoneC("us/pacific")) 
# define a time zone for a small island 1/2 hour east of GMT 
timeZoneList(small.island = timeZoneR(offset=1800)) 



