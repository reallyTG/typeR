library(timeR)


### Name: timer
### Title: A R6 Class to represent a timer.
### Aliases: timer
### Keywords: datasets

### ** Examples

timer1 <- createTimer()
timer1$start("event1")
# put some codes in between
timer1$stop("event1")

timer1$start("event2")
# put some codes in between
timer1$stop("event2",comment = "event 2 completed")

table1 <- getTimer(timer1)
timer1$toggleVerbose() # set verbose to FALSE as default is TRUE

table1 # print all records in a tibble(data frame)



