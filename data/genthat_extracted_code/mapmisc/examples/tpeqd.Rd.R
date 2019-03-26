library(mapmisc)


### Name: tpeqd
### Title: Two point equidistant and tilted perspective projections
### Aliases: tpeqd tpers

### ** Examples


tpeqd(rbind(c(0,0), c(10,50)))

data('netherlands')

tcrs = tpeqd(nldCities[1:2,])
tcrs

if(require('rgdal', quietly=TRUE)) {
nldT = spTransform(nldCities, tcrs)
projection(nldT)

map.new(nldT)
text(nldT,labels=nldT$name)
scaleBar(nldT, 'topright')

}




