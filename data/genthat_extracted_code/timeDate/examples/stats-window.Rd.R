library(timeDate)


### Name: window
### Title: Time Windows
### Aliases: window window.timeDate cut.timeDate
### Keywords: chron

### ** Examples
  
## timeCalendar - 
   # Monthly Dates in Current Year:
   tS = timeCalendar()
   tS 
   
## window -
   # 2nd Quarter Window:
   tS[4:6]
   window(tS, tS[4], tS[6])



