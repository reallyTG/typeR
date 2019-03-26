library(sgeostat)


### Name: plot.point
### Title: Plot Point Objects
### Aliases: plot.point
### Keywords: spatial

### ** Examples

## Don't show: 
if(length(ls(pat="maas.point"))==0){example(point)}
## End(Don't show)
plot(maas.point) 
plot(maas.point,v='zinc') 
plot(maas.point,v='zinc',xlab='easting',ylab='northing',axes=TRUE,legend.pos=4)
# plot additionally the maas bank:
data(maas.bank)
lines(maas.bank)



