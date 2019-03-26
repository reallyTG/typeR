library(MortalitySmooth)


### Name: summary.Mort1Dsmooth
### Title: Summary for Mort1Dsmooth objects
### Aliases: summary.Mort1Dsmooth print.summary.Mort1Dsmooth
### Keywords: models regression smooth

### ** Examples

## selected data
years <- 1970:2006
death <- selectHMDdata("Sweden", "Deaths", "Females",
                       ages = 0, years = years)
exposure <- selectHMDdata("Sweden", "Exposures", "Females",
                          ages = 0, years = years)
## fit
fit <- Mort1Dsmooth(x=years, y=death, offset=log(exposure),
                    method=3, lambda=30)
## summary
summary(fit)



