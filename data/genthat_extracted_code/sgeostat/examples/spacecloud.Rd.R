library(sgeostat)


### Name: spacecloud
### Title: Variogram Cloud
### Aliases: spacecloud
### Keywords: spatial

### ** Examples

## Don't show: 
# prepare variables from other example pages if they are not already there:
if(length(ls(pat="maas.pair"))==0){example(pair)}
## End(Don't show)
opar <- par(ask = interactive() && .Device == "X11")
spacecloud(maas.point,maas.pair,'zinc')
# identify some points:
spacecloud(maas.point,maas.pair,'zinc',query.a='zinc')
par(opar)



