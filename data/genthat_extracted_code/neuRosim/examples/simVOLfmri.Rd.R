library(neuRosim)


### Name: simVOLfmri
### Title: Simulate 3D or 4D fMRI data
### Aliases: simVOLfmri
### Keywords: high-level

### ** Examples

design <- simprepTemporal(totaltime=200, onsets=seq(1,200,40), 
	durations=20, TR=2, effectsize=1, hrf="double-gamma")
region <- simprepSpatial(regions=2, coord=list(c(32,15),c(57,45)), 
	radius=c(10,7), form="sphere", fading=TRUE)
out <- simVOLfmri(design=design, image=region, dim=c(64,64), 
	SNR=1, noise="none")
## Not run: plot(out[32,15,], type="l")
## Not run: 
##D library(lattice)
##D library(gplots)
##D levelplot(out[,,10],scales=list(tck=0), 
##D 	col.regions=colorpanel(50,high="white",low="black"))
## End(Not run)
## Don't show: 
rm(design,region,out)
## End(Don't show)



