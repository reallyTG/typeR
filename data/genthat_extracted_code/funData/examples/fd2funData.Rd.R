library(funData)


### Name: fd2funData
### Title: Convert an fd object to funData
### Aliases: fd2funData

### ** Examples

# Install / load package fda before running the examples
library("fda")

# from Data2fd help
daybasis <- create.fourier.basis(c(0, 365), nbasis=65)
# fd object of daily temperatures
tempfd <- Data2fd(argvals = day.5, y = CanadianWeather$dailyAv[,,"Temperature.C"], daybasis)
# convert to funData
tempFun <- fd2funData(tempfd, argvals = day.5)

# plot to compare
par(mfrow = c(1,2))
plot(tempfd, main = "fd object")
plot(tempFun, main = "funData object") 



