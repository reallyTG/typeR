library(baytrends)


### Name: eventNum
### Title: Event Processing
### Aliases: eventNum eventLen eventSeq eventSeq eventLen
### Keywords: internal manip

### ** Examples


## Notice the difference caused by setting reset to TRUE
eventNum(c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE))
eventNum(c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE), reset=TRUE)

## Notice the difference caused by setting reset to TRUE
eventSeq(eventNum(c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE)))
eventSeq(eventNum(c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE), reset=TRUE))

## Notice the difference caused by setting reset to TRUE
eventLen(eventNum(c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE), reset=TRUE))
## This is an example of the summary option
eventLen(eventNum(c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE), reset=TRUE), summary=TRUE)



