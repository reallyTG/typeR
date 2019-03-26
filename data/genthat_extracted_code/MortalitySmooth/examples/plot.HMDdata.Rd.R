library(MortalitySmooth)


### Name: plot.HMDdata
### Title: Plot age and year specific demographic data
### Aliases: plot.HMDdata
### Keywords: hplot

### ** Examples

## 1-D plot
popDENf <- selectHMDdata("Denmark", "Population",
                         "Females", 50:100, 2000) 
plot(popDENf, main="Danish female population, 2000",
     xlab="ages", pch=2, col=2)
ratDENf <- selectHMDdata("Denmark", "Rates",
                         "Females", 50:100, 2000)
plot(ratDENf, main="Danish female log death rates, 2000",
     xlab="ages")

## 2-D plot
years <- 1950:2000
ages <- 0:100
popJAPf <- selectHMDdata("Japan", "Population", "Females",
                         ages, years)
plot(popJAPf, main="Japanese female population")
ratSWEf <- selectHMDdata("Sweden", "Rates", "Females")
plot(ratSWEf, main="Swedish female log death rates")



