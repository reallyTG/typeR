library(synchrony)


### Name: plot.vario
### Title: Plot 'vario' objects
### Aliases: plot.vario

### ** Examples

data(pisco.data)
d=subset(pisco.data, subset=year==2000, select=c("latitude", "longitude", "sst"))
semiv=vario(data=d)
moran=vario(data=d, type="moran", nrand=100)
geary=vario(data=d, type="geary", nrand=100)

par(mfrow=c(3,1))
plot(semiv)
plot(moran, bg.sig="blue")
plot(geary, bg.sig="red")



