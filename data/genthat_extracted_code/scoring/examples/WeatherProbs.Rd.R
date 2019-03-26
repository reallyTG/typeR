library(scoring)


### Name: WeatherProbs
### Title: Three-category weather forecasts
### Aliases: WeatherProbs
### Keywords: datasets

### ** Examples

data("WeatherProbs")

## Brier score for temperature forecasts
## (Warning arises because some forecast rows don't sum to 1.)
res <- calcscore(tcat ~ tblw + tnrm + tabv, data=WeatherProbs,
                 bounds=c(0,1))

## Ordered Brier score for temperature forecasts
res2 <- calcscore(tcat ~ tblw + tnrm + tabv, data=WeatherProbs,
                  bounds=c(0,1), ordered=TRUE)

## Spherical score for temperature forecasts
res3 <- calcscore(tcat ~ tblw + tnrm + tabv, data=WeatherProbs,
                  fam="sph", bounds=c(0,1))

## Average scores by station
avgbrier <- with(WeatherProbs, tapply(res, stn, mean))
avgobrier <- with(WeatherProbs, tapply(res2, stn, mean))
avgsph <- with(WeatherProbs, tapply(res3, stn, mean))

## Conclusions vary across Brier and ordinal Brier scores
plot(avgbrier, avgobrier, pch=20, xlab="Brier", ylab="Ordinal Brier")



