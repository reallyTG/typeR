library(MortalitySmooth)


### Name: residuals.Mort2Dsmooth
### Title: Extract 2D P-splines Model Residuals
### Aliases: residuals.Mort2Dsmooth
### Keywords: models regression smooth

### ** Examples

## selected data
ages <- 30:80
years <- 1970:2006
death <- selectHMDdata("Switzerland", "Deaths",
                       "Males",
                       ages = ages, years = years) 
exposure <- selectHMDdata("Switzerland", "Exposures",
                          "Males",
                          ages = ages, years = years)
## fit
fit <- Mort2Dsmooth(x=ages, y=years, Z=death,
                    offset=log(exposure),
                    method=3, lambdas=c(300,10))

## extracting residuals
devR <- resid(fit, type="deviance")
ansR <- resid(fit, type="anscombe")
peaR <- resid(fit, type="pearson")
worR <- resid(fit, type="working")

## plotting deviance residuals over age and years
res.list <- list(ages=ages, years=years)
res.grid <- expand.grid(res.list)
res.grid$dev <- c(devR)
levelplot(dev~years*ages, res.grid,
          at=c(min(devR), -2, -1, 1, 2, max(devR)))



