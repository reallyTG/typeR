library(sgeostat)


### Name: identify.point
### Title: Identify points on a Point Object
### Aliases: identify.point
### Keywords: spatial

### ** Examples

## Don't show: 
# prepare variables from other example pages if they are not already there:
if(length(ls(pat="maas.point"))==0){example(point)}
## End(Don't show)
plot(maas.point)
# use indices as labels:
identify(maas.point)
# use values as labels:
identify(maas.point,v="zinc")



