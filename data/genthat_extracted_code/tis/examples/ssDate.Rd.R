library(tis)


### Name: ssDate
### Title: ssDate Objects
### Aliases: ssDate as.ssDate is.ssDate
### Keywords: chron

### ** Examples

dec31 <- ssDate(20041231)
jan30 <- ssDate("2005-1-30")
jan30 - dec31              ## 30
feb28 <- jan30 + 29
ssDate()                      ## current date



