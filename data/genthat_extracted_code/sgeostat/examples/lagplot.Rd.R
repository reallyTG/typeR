library(sgeostat)


### Name: lagplot
### Title: Lag Scatter Plot
### Aliases: lagplot
### Keywords: spatial

### ** Examples

## Don't show: 
# prepare variables from other example pages if they are not already there:
if(length(ls(pat="maas.pair"))==0){example(pair)}
## End(Don't show)
opar <- par(ask = interactive() && .Device == "X11")
lagplot(maas.point,maas.pair,'zinc')
# with identifying pairs:
lagplot(maas.point,maas.pair,'zinc',lag=2,query.a='zinc')
par(opar)



