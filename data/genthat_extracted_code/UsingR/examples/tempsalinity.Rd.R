library(UsingR)


### Name: tempsalinity
### Title: Temperature/Salinity measurements along a moving Eddy
### Aliases: tempsalinity
### Keywords: datasets

### ** Examples

data(tempsalinity)
if(require(zoo)) {
  plot(tempsalinity[,3:4])
  ## overide plot.zoo method
  plot.default(tempsalinity[,3:4])
  abline(lm(salinity ~ temperature, tempsalinity, subset = 1:67))
  abline(lm(salinity ~ temperature, tempsalinity, subset = -(1:67)))
  }



