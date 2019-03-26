library(strucchange)


### Name: supLM
### Title: Generators for efpFunctionals along Continuous Variables
### Aliases: supLM maxMOSUM
### Keywords: regression

### ** Examples

## seatbelt data
data("UKDriverDeaths")
seatbelt <- log10(UKDriverDeaths)
seatbelt <- cbind(seatbelt, lag(seatbelt, k = -1), lag(seatbelt, k = -12))
colnames(seatbelt) <- c("y", "ylag1", "ylag12")
seatbelt <- window(seatbelt, start = c(1970, 1), end = c(1984,12))

## empirical fluctuation process
scus.seat <- gefp(y ~ ylag1 + ylag12, data = seatbelt)

## supLM test
plot(scus.seat, functional = supLM(0.1))
## MOSUM test
plot(scus.seat, functional = maxMOSUM(0.25))
## double maximum test
plot(scus.seat)
## range test
plot(scus.seat, functional = rangeBB)
## Cramer-von Mises statistic (Nyblom-Hansen test)
plot(scus.seat, functional = meanL2BB)



