library(timeR)


### Name: getTimer
### Title: Get the data frame in timer object
### Aliases: getTimer

### ** Examples

timer1 <- createTimer()
timer1$start("event1")
Sys.sleep(1)
timer1$stop("event1")
getTimer(timer1)



