library(timeR)


### Name: createTimer
### Title: Create a timer object
### Aliases: createTimer

### ** Examples

timer1 <- createTimer() # print is enabled
timer1 <- createTimer(FALSE) # print is disabled
timer1$start("event1") # start timing for event 1
timer1$stop("event1", comment = "event 1 stopped") # stop timing for event 1(comment is optional)
getTimer(timer1) # get all records in a data frame



