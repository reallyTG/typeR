library(MortalitySmooth)


### Name: plot.Mort2Dsmooth
### Title: Plot of the Mort2Dsmooth outcomes
### Aliases: plot.Mort2Dsmooth
### Keywords: regression smooth hplot

### ** Examples

## selected data
ages <- 50:100
years <- 1970:2006
death <- selectHMDdata("Denmark", "Deaths", "Females",
                       ages = ages, years = years) 
exposure <- selectHMDdata("Denmark", "Exposures", "Females",
                          ages = ages, years = years)
## fit
fit <- Mort2Dsmooth(x=ages, y=years, Z=death,
                    offset=log(exposure),
                    method=3, lambdas=c(100,500)) 
## plotting log-death rates
plot(fit, palette="terrain.colors")
## plotting death counts
plot(fit, type="death")



