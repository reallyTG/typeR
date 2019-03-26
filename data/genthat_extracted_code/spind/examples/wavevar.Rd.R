library(spind)


### Name: wavevar
### Title: Wavelet variance analysis
### Aliases: wavevar

### ** Examples

data(carlinadata)

coords <- carlinadata[ ,4:5]
pv <- covar.plot(carlina.horrida ~ aridity + land.use,
                 data = carlinadata,
                 coord = coords,
                 wavelet = 'd4',
                 wtrafo = 'modwt',
                 plot = 'var')

pv$plot




