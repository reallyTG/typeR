library(fda)


### Name: dateAccessories
### Title: Numeric and character vectors to facilitate working with dates
### Aliases: dateAccessories monthAccessories dayOfYear dayOfYearShifted
###   day.5 daysPerMonth monthEnd monthEnd.5 monthBegin.5 monthMid
###   monthLetters weeks
### Keywords: datasets

### ** Examples

daybasis65 <- create.fourier.basis(c(0, 365), 65)
daytempfd <- with(CanadianWeather, smooth.basisPar(day.5,
    dailyAv[,,"Temperature.C"], daybasis65)$fd )
plot(daytempfd, axes=FALSE)
axisIntervals(1)
# axisIntervals by default uses
# monthBegin.5, monthEnd.5, monthMid, and month.abb
axis(2)



