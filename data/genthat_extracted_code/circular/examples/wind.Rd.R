library(circular)


### Name: wind
### Title: Col De La Roa wind direction
### Aliases: wind
### Keywords: datasets

### ** Examples

  data(wind)
  wind <- circular(wind, template='geographics')
  par(mfcol=c(1,2))
  plot(wind)
  plot(density(wind, bw=40), main='')



