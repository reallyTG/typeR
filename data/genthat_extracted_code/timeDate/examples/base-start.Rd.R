library(timeDate)


### Name: start
### Title: Terminal Times and Range
### Aliases: start end start.timeDate end.timeDate min.timeDate
###   max.timeDate range.timeDate
### Keywords: chron

### ** Examples
  
## timeCalendar - 
   # Random Calendar Dates:
   tR = sample(timeCalendar())
   sort(tR)
   tR
    
## start | end  -
   start(tR)
   end(tR)
   
## The First and Last Time Stamp:
   tR[1]
   tR[length(tR)]
   rev(tR)[1]
   
## The Range:
   c(start(tR), end(tR))
   range(tR)



