library(sgeostat)


### Name: fit.variogram
### Title: Variogram Model Fit
### Aliases: fit.variogram fit.exponential fit.wave fit.gaussian
###   fit.spherical fit.linear
### Keywords: spatial

### ** Examples

## Don't show: 
# prepare variables from other example pages if they are not already there:
if(length(ls(pat="maas.v"))==0){example(est.variogram)}
## End(Don't show)
#
# automatic fit:
#
maas.vmod<-fit.gaussian(maas.v,c0=60000,cg=110000,ag=800,plot.it=TRUE,
                        iterations=30)
#
# iterations=0, means no fit, intended for "subjective" fit
#
maas.vmod.fixed<-fit.variogram("gaussian",maas.v,nugget=60000,sill=110000,
                               range=800,plot.it=TRUE,iterations=0)



