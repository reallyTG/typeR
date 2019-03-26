library(DSpat)


### Name: simDSpat
### Title: Simulate a distance sample from a specified spatial point
###   process
### Aliases: simDSpat

### ** Examples

# Code stored in a function to speed up package checking run by typing do.simDSpat
# Some portions of this code will not pass the packge check on Linux and Mac and will issue
# an error that the polygons intersect even though when run as an example, the
# error is not encountered; so polygon checking is turned off
do.simDSpat=function()
{
# Now that it is in a function shouldn't need following line
spatstat.options(checkpolygons=FALSE)
study.area=owin(poly=list(x=c(0,40,40,100,100,0),y=c(0,0,40,40,100,100)))
covariates = simCovariates(hab.range=30, probs=c(1/3,2/3))
simdata=simDSpat(study.area,covariates,int.formula=~factor(habitat),
                   int.par=c(0,1,2),angle=45,nlines=10,width=3,det.par=.1)
sim.dspat=dspat(int.formula=~factor(habitat),study.area=study.area,
               obs=simdata$observations,lines=simdata$lines,
               covariates=covariates,epsvu=c(1,.05))
summary(sim.dspat)
AIC(sim.dspat)
coef(sim.dspat)
mu.B <- integrate.intensity(sim.dspat,dimyx=100,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')

mu.B <- integrate.intensity(sim.dspat,dimyx=100,se=TRUE,od=TRUE,reps=50)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error (corrected) =  ', round(mu.B$precision.od$se,0), "\n",
    '95 Percent Conf. Int.(corrected)  =   (', round(mu.B$precision.od$lcl.95,0), ',',
           round(mu.B$precision.od$ucl.95,0), ')', '\n')
plot(mu.B$lambda, main='Estimated Intensity')
plot(sim.dspat$lines.psp,lty=2,add=TRUE)
plot(owin(poly=sim.dspat$transect),add=TRUE)
plot(sim.dspat$model$Q$data,add=TRUE)
# Now sample with same point process realization with a different sampling angle
dev.new()
simdata=simDSpat(study.area,covariates,int.formula=~factor(habitat),
                   int.par=c(0,1,2),angle=90,nlines=10,width=3,pts=simdata$pts)
sim.dspat=dspat(int.formula=~factor(habitat),study.area=study.area,
               obs=simdata$observations,lines=simdata$lines,
               covariates=covariates,epsvu=c(1,.05))
mu.B <- integrate.intensity(sim.dspat,dimyx=100,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
mu.B <- integrate.intensity(sim.dspat,dimyx=100,se=TRUE,od=TRUE,reps=50)
cat('Abundance  =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error (corrected)=  ', round(mu.B$precision.od$se,0), "\n",
    '95 Percent Conf. Int. (corrected)=   (', round(mu.B$precision.od$lcl.95,0), ',',
           round(mu.B$precision.od$ucl.95,0), ')', '\n')
plot(mu.B$lambda, main='Estimated Intensity')
plot(sim.dspat$lines.psp,lty=2,add=TRUE)
plot(owin(poly=sim.dspat$transect),add=TRUE)
spatstat.options(checkpolygons=TRUE)
plot(sim.dspat$model$Q$data,add=TRUE)
# Sample with detection as a function of habitat
dev.new()
study.area=owin(poly=list(x=c(0,40,40,100,100,0),y=c(0,0,40,40,100,100)))
simdata=simDSpat(study.area,covariates,int.formula=~factor(habitat),
                   int.par=c(0,1,2),angle=45,nlines=10,width=3,
                   det.par=c(.1,.5,-.2),det.formula=~factor(habitat))
sim.dspat=dspat(int.formula=~factor(habitat),det.formula=~factor(habitat),
                study.area=study.area, obs=simdata$observations,lines=simdata$lines,
                covariates=covariates,epsvu=c(1,.05))
summary(sim.dspat)
AIC(sim.dspat)
coef(sim.dspat)
mu.B <- integrate.intensity(sim.dspat,dimyx=100,se=TRUE)
cat('Abundance =       ', round(mu.B$abundance,0), "\n")
cat('Standard Error =  ', round(mu.B$precision$se,0), "\n",
    '95 Percent Conf. Int. =   (', round(mu.B$precision$lcl.95,0), ',',
           round(mu.B$precision$ucl.95,0), ')', '\n')
plot(mu.B$lambda, main='Estimated Intensity')
plot(sim.dspat$lines.psp,lty=2,add=TRUE)
plot(owin(poly=sim.dspat$transect),add=TRUE)
plot(sim.dspat$model$Q$data,add=TRUE)
############################################################
# Generate example like Figure used in paper for simulations
# Note: it required a patch to plot.im from spatstat to
# fix the ribbon bar on the side.
#
#
#             if(is.null(list(...)$zlim))
#            {
#               ribbonvalues <- seq(vrange[1], vrange[2], length = ribn)
#               ribbonrange <- vrange
#               ribbonticks <- clamp(pretty(ribbonvalues), vrange)
#            }
#            else
#            {
#               zlim=list(...)$zlim
#               ribbonvalues <- seq(zlim[1], zlim[2], length = ribn)
#               ribbonrange <- zlim
#               ribbonticks <- clamp(pretty(ribbonvalues), zlim)
#            }
#
#############################################################
study.area=owin(poly=list(x=c(0,100,100,0),y=c(0,0,100,100)))
covariates = simCovariates(hab.range=30, probs=c(1/3,2/3))
postscript("Figure1.eps",horizontal=FALSE)
par(mfrow=c(2,1),mar=c(3, 1, 3, 1) + 0.1)
k=10
width=0.04*100/k
En=75
p=0.25
EN=En/(.04*p)
simdata=simDSpat(study.area,covariates,int.formula=~factor(habitat)+river,EN=EN,
                   int.par=c(0,1,2,-1),angle=90,nlines=k,width=width,
                   det.par=log(width/5),showplot=TRUE,col=gray(1-c(1:100)/120),
                   breaks=(0:100)*2.5/100,
                   zlim=c(0,2.5))
                   
lines(c(50,50),c(0,100),lty=2)
sim.dspat=dspat(int.formula=~factor(habitat)+river,study.area=study.area,
               obs=simdata$observations,lines=simdata$lines,
               covariates=covariates,epsvu=c(1,width/100))
summary(sim.dspat)
AIC(sim.dspat)
coef(sim.dspat)
mu.B <- integrate.intensity(sim.dspat,dimyx=100)
plot(mu.B$lambda, col=gray(1-c(1:100)/120), main='Estimated Intensity',
  breaks=(0:100)*2.5/100,zlim=c(0,2.5))
plot(sim.dspat$lines.psp,lty=2,add=TRUE)
plot(owin(poly=sim.dspat$transect),add=TRUE)
plot(sim.dspat$model$Q$data,add=TRUE)
dev.off()
spatstat.options(checkpolygons=TRUE)
}



