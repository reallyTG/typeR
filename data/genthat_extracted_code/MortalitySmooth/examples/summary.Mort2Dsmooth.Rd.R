library(MortalitySmooth)


### Name: summary.Mort2Dsmooth
### Title: Summary for Mort2Dsmooth objects
### Aliases: summary.Mort2Dsmooth print.summary.Mort2Dsmooth
### Keywords: models regression smooth

### ** Examples

## selected data
ages <- 10:60
years <- 1950:2006
death <- selectHMDdata("Sweden", "Deaths", "Males",
                       ages = ages, years = years) 
exposure <- selectHMDdata("Sweden", "Exposures", "Males",
                          ages = ages, years = years)
## fit
fit <- Mort2Dsmooth(x=ages, y=years, Z=death,
                    offset=log(exposure),
                    method=3, lambdas=c(0.1, 1000))
## summary
summary(fit)



