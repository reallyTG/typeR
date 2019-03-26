library(dplR)


### Name: chron
### Title: Build Mean Value Chronology
### Aliases: chron
### Keywords: manip

### ** Examples
library(graphics)
library(utils)
data(ca533)
ca533.rwi <- detrend(rwl = ca533, method = "ModNegExp")
ca533.crn <- chron(ca533.rwi, prefix = "CAM")
plot(ca533.crn,xlab="Year",ylab="RWI")
## With residual chron
ca533.crn <- chron(ca533.rwi, prefix = "CAM", prewhiten = TRUE)



