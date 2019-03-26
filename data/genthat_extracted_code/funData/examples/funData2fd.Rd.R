library(funData)


### Name: funData2fd
### Title: Convert a funData object to fd
### Aliases: funData2fd

### ** Examples

# Install / load package fda before running the examples
library("fda")

# from Data2fd help
daybasis <- create.fourier.basis(c(0, 365), nbasis=65)
# funData object with temperature
tempFun <- funData(day.5, t(CanadianWeather$dailyAv[, , "Temperature.C"]))
# convert to fd
tempfd <- funData2fd(tempFun, daybasis)

# plot to compare
par(mfrow = c(1,2))
plot(tempFun, main = "funData object (raw data)")
plot(tempfd, main = "fd object (smoothed)")



