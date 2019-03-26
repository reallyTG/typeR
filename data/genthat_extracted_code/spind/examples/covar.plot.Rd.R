library(spind)


### Name: covar.plot
### Title: Plot wavelet variance/covariance
### Aliases: covar.plot

### ** Examples

data(carlinadata)
coords <- carlinadata[,4:5]

covariance <- covar.plot(carlina.horrida ~ aridity + land.use - 1,
                         data = carlinadata,
                         coord = coords,
                         wavelet = "d4",
                         wtrafo = 'modwt',
                         plot = 'covar')

covariance$plot
covariance$result

variance <- covar.plot(carlina.horrida ~ aridity + land.use - 1,
                       data = carlinadata,
                       coord = coords,
                       wavelet = "d4",
                       wtrafo = 'modwt',
                       plot = 'var')

variance$plot
variance$result




