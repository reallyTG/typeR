library(timeDate)


### Name: finCenter
### Title: Financial Center of a timeDate object
### Aliases: finCenter finCenter,timeDate-method finCenter<-
###   finCenter<-,timeDate-method

### ** Examples

date <- timeDate("2008-01-01")
finCenter(date) <- "GMT"
date

finCenter(date) <- "Zurich"
date



