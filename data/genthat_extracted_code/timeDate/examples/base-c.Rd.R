library(timeDate)


### Name: c
### Title: Concatenating 'timeDate' Objects
### Aliases: c c.timeDate
### Keywords: chron

### ** Examples

## timeCalendar -
   # Create Character Vectors:
   GMT = timeCalendar(zone = "GMT", FinCenter = "GMT") + 16*3600
   ZUR = timeCalendar(zone = "GMT", FinCenter = "Zurich") + 16*3600
   
## c - 
   # Concatenate and Replicate timeDate Objects:
   sort(c(GMT, ZUR))
   sort(c(ZUR, GMT))



