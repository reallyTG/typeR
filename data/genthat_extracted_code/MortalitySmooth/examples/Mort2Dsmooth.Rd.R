library(MortalitySmooth)


### Name: Mort2Dsmooth
### Title: Fit Two-dimensional Poisson P-splines
### Aliases: Mort2Dsmooth print.Mort2Dsmooth
### Keywords: models regression smooth

### ** Examples

## selected data
ages <- 50:100
years <- 1950:2006
death <- selectHMDdata("Sweden", "Deaths", "Females",
                       ages = ages, years = years) 
exposure <- selectHMDdata("Sweden", "Exposures", "Females",
                          ages = ages, years = years)

## fit with BIC
fitBIC <- Mort2Dsmooth(x=ages, y=years, Z=death,
                       offset=log(exposure)) 
fitBIC
summary(fitBIC)

## plot age 50 log death rates (1st row)
plot(years, log(death[1,]/exposure[1,]),
     main="Mortality rates, log-scale.
           Swedish females, age 50, 1950:2006")
lines(years, fitBIC$logmortality[1,], col=2, lwd=2)

## plot over age and years
## fitted log death rates from fitBIC
grid. <- expand.grid(list(ages=ages, years=years))
grid.$lmx <- c(fitBIC$logmortality)
levelplot(lmx ~ years * ages , grid., 
          at=quantile(grid.$lmx, seq(0,1,length=10)),
          col.regions=rainbow(9))

## see vignettes for examples on
## - Extra-Poisson variation
## - interpolation
## - extrapolation



