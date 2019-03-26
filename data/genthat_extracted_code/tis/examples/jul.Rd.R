library(tis)


### Name: jul
### Title: Julian Date Objects
### Aliases: jul jul.Date jul.IDate jul.default jul.ti jul.yearmon
###   jul.yearqtr as.jul asJul is.jul
### Keywords: chron

### ** Examples

dec31 <- jul(20041231)
jan30 <- jul("2005-1-30")
jan30 - dec31              ## 30
feb28 <- jan30 + 29
jul()                      ## current date



