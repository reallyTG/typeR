library(dse)


### Name: minForecastCov
### Title: Minimum Forecast Cov Models
### Aliases: minForecastCov
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
z <- stripMine(eg1.DSE.data.diff, essential.data=c(1,2),
                   estimation.methods=list(estVARXls=list(max.lag=3)))
z <-  minForecastCov(z)



