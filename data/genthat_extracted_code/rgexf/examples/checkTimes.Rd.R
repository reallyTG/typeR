library(rgexf)


### Name: checkTimes
### Title: Checks for correct time format
### Aliases: checkTimes
### Keywords: utilities

### ** Examples

  test <- c("2012-01-17T03:46:41", "2012-01-17T03:46:410")
  checkTimes(test, format="dateTime")
  checkTimes("2012-02-01T00:00:00", "dateTime")



