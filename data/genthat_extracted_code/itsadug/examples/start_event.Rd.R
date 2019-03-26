library(itsadug)


### Name: start_event
### Title: Determine the starting point for each time series.
### Aliases: start_event

### ** Examples

data(simdat)
head(simdat)
test <- start_event(simdat, event=c("Subject", "Trial"), label.event="Event") 
head(test)



