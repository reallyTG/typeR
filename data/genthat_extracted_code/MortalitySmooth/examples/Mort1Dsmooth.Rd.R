library(MortalitySmooth)


### Name: Mort1Dsmooth
### Title: Fit One-dimensional Poisson P-splines
### Aliases: Mort1Dsmooth print.Mort1Dsmooth
### Keywords: models regression smooth

### ** Examples

## selected data
years <- 1950:2006
death <- selectHMDdata("Japan", "Deaths", "Females",
                       ages = 80, years = years)
exposure <- selectHMDdata("Japan", "Exposures", "Females",
                          ages = 80, years = years)
## various fits
## default using Bayesian Information Criterion
fitBIC <- Mort1Dsmooth(x=years, y=death,
                       offset=log(exposure))
fitBIC
summary(fitBIC)
## subjective choice of the smoothing parameter lambda
fitLAM <- Mort1Dsmooth(x=years, y=death,
                       offset=log(exposure),
                       method=3, lambda=10000)
## plot
plot(years, log(death/exposure),
main="Mortality rates, log-scale.
      Japanese females, age 80, 1950:2006")
lines(years, fitBIC$logmortality, col=2, lwd=2)
lines(years, fitLAM$logmortality, col=3, lwd=2)
legend("topright", c("Actual", "BIC", "lambda=10000"),
       col=1:3, lwd=c(1,2,2), lty=c(-1,1,1),
       pch=c(1,-1,-1))

## see vignettes for examples on
## - Extra-Poisson variation
## - interpolation
## - extrapolation



