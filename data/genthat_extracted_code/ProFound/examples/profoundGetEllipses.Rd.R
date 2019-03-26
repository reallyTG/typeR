library(ProFound)


### Name: profoundGetEllipses
### Title: Calculate multiple annulus properties of iso-photal ellipses
### Aliases: profoundGetEllipses
### Keywords: ellipse

### ** Examples

## Not run: 
##D # We need the ProFit library to show the profile: library(ProFit)
##D image = readFITS(system.file("extdata", 'KiDS/G278109fitim.fits',
##D package="ProFit"))$imDat
##D segim = readFITS(system.file("extdata", 'KiDS/G278109segim.fits',
##D package="ProFit"))$imDat
##D ellipses_nobox = profoundGetEllipses(image=image, segim=segim, levels=20, dobox=FALSE,
##D pixscale=0.2)
##D ellipses_box = profoundGetEllipses(image=image, segim=segim, levels=20, dobox=TRUE,
##D pixscale=0.2)
##D 
##D magplot(ellipses_box$ellipses$radhi[4:19], ellipses_nobox$ellipses$SB[4:19],
##D ylim=c(25,17), grid=TRUE, type='l')
##D points(ellipses_box$ellipses$radhi[4:19],ellipses_box$ellipses$SB[4:19])
##D #A rough bulge+disk surface brightness profile (mean axrat~0.6):
##D rlocs=seq(1,30,by=0.1)
##D bulge=profitRadialSersic(rlocs, mag=18.2, re=1.7, nser=3)
##D disk=profitRadialSersic(rlocs, mag=18, re=13, nser=0.7)
##D lines(rlocs, profoundFlux2SB(bulge, pixscale=0.2), col='red')
##D lines(rlocs, profoundFlux2SB(disk, pixscale=0.2), col='blue')
##D lines(rlocs, profoundFlux2SB(bulge+disk, pixscale=0.2), col='green')
##D #To get correct magnitudes you would need to modify the components by the axrat
##D #and pixel scale.
##D 
##D #We can do a better 1D fit with ease:
##D #Since the ellipses are divided by equi-flux we can minimise sum-square of the SB diff:
##D sumsq1D=function(par=c(17.6, log10(1.7), log10(3), 17.4, log10(13), log10(0.7)),
##D rad, SB, pixscale=1){
##D   bulge=profitRadialSersic(rad, mag=par[1], re=10^par[2], nser=10^par[3])
##D   disk=profitRadialSersic(rad, mag=par[4], re=10^par[5], nser=10^par[6])
##D   total=profoundFlux2SB(bulge+disk, pixscale=pixscale)
##D   return=sum((total-SB)^2)
##D }
##D 
##D lower=c(10,0,-0.5,10,0,-0.5)
##D upper=c(30,2,1,30,2,1)
##D 
##D fit1D=optim(sumsq1D, par=c(17.6, log10(1.7), log10(3), 17.4, log10(13), log10(0.7)),
##D rad=ellipses_box$ellipses$radhi[4:19], SB=ellipses_box$ellipses$SB[4:19], pixscale=0.2,
##D method='L-BFGS-B', lower=lower, upper=upper)$par
##D 
##D magplot(ellipses_box$ellipses$radhi[4:19], ellipses_nobox$ellipses$SB[4:19],
##D ylim=c(25,17), grid=TRUE, type='l')
##D points(ellipses_box$ellipses$radhi[4:19],ellipses_box$ellipses$SB[4:19])
##D #A simple bulge+disk surface brightness profile:
##D rlocs=seq(1,30,by=0.1)
##D bulge=profitRadialSersic(rlocs, mag=fit1D[1], re=10^fit1D[2], nser=10^fit1D[3])
##D disk=profitRadialSersic(rlocs, mag=fit1D[4], re=10^fit1D[5], nser=10^fit1D[6])
##D lines(rlocs, profoundFlux2SB(bulge, pixscale=0.2), col='red')
##D lines(rlocs, profoundFlux2SB(disk, pixscale=0.2), col='blue')
##D lines(rlocs, profoundFlux2SB(bulge+disk, pixscale=0.2), col='green')
## End(Not run)



