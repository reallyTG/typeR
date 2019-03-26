library(mvoutlier)


### Name: humus
### Title: Humus Layer (O-horizon) of the Kola Data
### Aliases: humus
### Keywords: datasets

### ** Examples

data(humus)
# classical versus robust correlation:
corr.plot(log(humus[,"Al"]), log(humus[,"Na"]))



