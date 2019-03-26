library(hht)


### Name: EEMDResift
### Title: Resift averaged IMFs from EEMD
### Aliases: EEMDResift
### Keywords: ts

### ** Examples

data(PortFosterEvent)

trials=10
nimf=10
noise.amp=6.4e-07
trials.dir="test"

set.seed(628)

#Run EEMD (this may take some time)
## Not run: EEMD(sig, tt, noise.amp, trials, nimf, noise.amp, trials.dir = trials.dir)

#Compile the results
## Not run: EEMD.result <- EEMDCompile(trials.dir, trials, nimf)


resift.rule="max.var"
## Not run: resift.result <- EEMDResift(EEMD.result, resift.rule)

#Plot the IMFs
time.span=c(5, 10)
imf.list=1:3
os=TRUE
res=TRUE
## Not run: PlotIMFs(resift.result, time.span, imf.list, os, res)



