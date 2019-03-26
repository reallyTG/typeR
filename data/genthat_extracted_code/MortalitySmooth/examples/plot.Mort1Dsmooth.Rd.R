library(MortalitySmooth)


### Name: plot.Mort1Dsmooth
### Title: Plot of the Mort1Dsmooth outcomes
### Aliases: plot.Mort1Dsmooth
### Keywords: hplot regression smooth

### ** Examples

## selected data
years <- 1930:2006
death <- selectHMDdata("Denmark", "Deaths", "Females",
                       ages = 60, years = years)
exposure <- selectHMDdata("Denmark", "Exposures", "Females",
                          ages = 60, years = years)
## fit
fit <- Mort1Dsmooth(x=years, y=death, offset=log(exposure),
                    method=3, lambda=100)
## plotting actual and fitted data
par(mfrow=c(1,2))
plot(fit)
plot(fit, "deaths")
par(mfrow=c(1,1))



