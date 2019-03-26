library(neuRosim)


### Name: neuRosim-package
### Title: Functions to Generate fMRI Data Including Activated Data, Noise
###   Data and Resting State Data
### Aliases: neuRosim-package neuRosim
### Keywords: package

### ** Examples

## Generate fMRI time series for block design
design <- simprepTemporal(totaltime=200, onsets=seq(1,200,40),
	 durations=20, TR=2, effectsize=1, hrf="double-gamma")
ts <- simTSfmri(design=design, SNR=1, noise="white")
## Not run: plot(ts, type="l")
## Don't show: 
rm(design,ts)
## End(Don't show)
## Generate fMRI slice for block design with activation in 2 regions
design <- simprepTemporal(totaltime=200, onsets=seq(1,200,40), 
	durations=20, TR=2, effectsize=1, hrf="double-gamma")
region <- simprepSpatial(regions=2, coord=list(c(32,15),c(57,45)), 
	radius=c(10,7), form="sphere")
out <- simVOLfmri(design=design, image=region, dim=c(64,64), 
	SNR=1, noise="none")
## Not run: plot(out[32,15,], type="l")
## Don't show: 
rm(design,region,out)
## End(Don't show)



