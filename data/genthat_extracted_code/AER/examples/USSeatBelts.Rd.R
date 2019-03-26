library(AER)


### Name: USSeatBelts
### Title: Effects of Mandatory Seat Belt Laws in the US
### Aliases: USSeatBelts
### Keywords: datasets

### ** Examples

data("USSeatBelts")
summary(USSeatBelts)

library("lattice")
xyplot(fatalities ~ as.numeric(as.character(year)) | state, data = USSeatBelts, type = "l")



