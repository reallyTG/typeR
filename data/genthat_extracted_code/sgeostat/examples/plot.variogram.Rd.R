library(sgeostat)


### Name: plot.variogram
### Title: Plot Variogram
### Aliases: plot.variogram
### Keywords: spatial

### ** Examples

## Don't show: 
# prepare variables from other example pages if they are not already there:
if(length(ls(pat="maas.vmod"))==0){example(fit.variogram)}
## End(Don't show)
# two plots 
oldpar <- par(mfrow=c(2,1))
plot(maas.v) 
plot(maas.v,var.mod.obj=maas.vmod)
par(oldpar)



