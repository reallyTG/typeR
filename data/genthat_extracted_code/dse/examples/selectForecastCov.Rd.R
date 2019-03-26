library(dse)


### Name: selectForecastCov
### Title: Select Forecast Covariances Meeting Criteria
### Aliases: selectForecastCov
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
z <- stripMine(eg1.DSE.data.diff, essential.data=c(1,2),
                   estimation.methods=list(estVARXls=list(max.lag=3)))
z <-  selectForecastCov(z)
tfplot(selectForecastCov(z, select.cov.bound=20000))
tfplot(selectForecastCov(z, select.cov.best=1))



