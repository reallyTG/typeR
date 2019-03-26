library(MortalitySmooth)


### Name: residuals.Mort1Dsmooth
### Title: Extract 1D P-splines Model Residuals
### Aliases: residuals.Mort1Dsmooth
### Keywords: models regression smooth

### ** Examples

## selected data
years <- 1970:2006
death <- selectHMDdata("Denmark", "Deaths", "Females",
                       ages = 60, years = years)
exposure <- selectHMDdata("Denmark", "Exposures", "Females",
                          ages = 60, years = years)
## fit
fit <- Mort1Dsmooth(x=years, y=death, offset=log(exposure),
                    method=3, lambda=1000)

## extracting residuals
devR <- resid(fit, type="deviance")
ansR <- resid(fit, type="anscombe")
peaR <- resid(fit, type="pearson")
worR <- resid(fit, type="working")
## summaries
summary(devR)
summary(ansR)
summary(peaR)
summary(worR)



