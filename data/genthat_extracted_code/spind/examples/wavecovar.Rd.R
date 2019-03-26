library(spind)


### Name: wavecovar
### Title: Wavelet covariance analysis
### Aliases: wavecovar

### ** Examples

data(carlinadata)

coords <- carlinadata[ ,4:5]
pc <- covar.plot(carlina.horrida ~ aridity + land.use,
                 data = carlinadata,
                 coord = coords,
                 wavelet = 'd4',
                 wtrafo = 'modwt',
                 plot = 'covar')

pc$plot




