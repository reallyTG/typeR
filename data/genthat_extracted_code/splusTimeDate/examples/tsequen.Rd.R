library(splusTimeDate)


### Name: timeSequence
### Title: Create a Time Sequence Object
### Aliases: timeSequence
### Keywords: chron

### ** Examples

timeSequence("1/1/1992", "12/1/1992", by = "months") 
timeSequence("1/3/1992", "12/5/1992", by = "months", align.by=TRUE) 
timeSequence("1/1/1992", "1/31/1992", by = "weeks", align.by=TRUE,  
             week.align="Mon")
timeSequence("1/1/1992", "12/31/1992", by="weekdays", exceptions=holidays(1992))
timeSequence("1/1/1992", "1/1/1995", by="months", exceptions=timeEvent("1/1/1993", "12/31/1993"))



