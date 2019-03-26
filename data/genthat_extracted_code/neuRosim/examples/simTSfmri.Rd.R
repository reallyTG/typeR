library(neuRosim)


### Name: simTSfmri
### Title: Simulate fMRI time series
### Aliases: simTSfmri
### Keywords: high-level

### ** Examples

design <- simprepTemporal(totaltime=200, onsets=seq(1,200,40), 
	durations=20, effectsize=1, TR=2, hrf="double-gamma")
ts <- simTSfmri(design=design, SNR=1, noise="white")
## Not run: plot(ts, type="l")
## Don't show: 
rm(design,ts)
## End(Don't show)



