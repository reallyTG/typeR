library(synchrony)


### Name: plot.variofit
### Title: Plot 'variofit' objects
### Aliases: plot.variofit

### ** Examples

# Environmental variogram
data(pisco.data)
d=subset(pisco.data, subset=year==2000, select=c("latitude", "longitude", "upwelling"))
semiv=vario(data=d)
mod.sph=vario.fit(semiv$vario, semiv$mean.bin.dist)
plot(mod.sph)



