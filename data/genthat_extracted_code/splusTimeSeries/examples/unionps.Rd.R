library(splusTimeSeries)


### Name: unionPositions
### Title: Positions Object Union With Tolerance
### Aliases: unionPositions
### Keywords: ts

### ** Examples

unionPositions(1:10, 5:20) 
unionPositions(1:10, 5.1:20.1, matchtol=.3) 
unionPositions(timeCalendar(d=1:10), timeCalendar(d=5:20)) 
unionPositions(timeCalendar(d=1:10, zone="PST"),  
               timeCalendar(d=5:20, zone="EST")) 
unionPositions(timeCalendar(d=1:10, zone="PST"),  
               timeCalendar(d=5:20, zone="EST"), localzone=TRUE) 



