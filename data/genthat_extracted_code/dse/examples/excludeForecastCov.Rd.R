library(dse)


### Name: excludeForecastCov
### Title: Filter Object to Remove Forecasts
### Aliases: excludeForecastCov
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
z <- stripMine(eg1.DSE.data.diff, essential.data=c(1,2),
                   estimation.methods=list(estVARXls=list(max.lag=3)))
z <-  excludeForecastCov(z, exclude.series=3)



