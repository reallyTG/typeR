library(erah)


### Name: plotChr
### Title: Plotting sample chromatogram
### Aliases: plotChr

### ** Examples

## No test: 
# First, an experiment has to be already created by newExp()
# then, each sample chromatogram can be plotted by:

plotChr(Experiment, 1, "BIC")
plotChr(Experiment, 1, "TIC", xlim=c(5,7))  #Plots from minute 5 to 7.

plotChr(Experiment, 1, "EIC", mz=50:70, xlim=c(5,7))  #Plots 
# from minute 5 to 7, and only the masses from 50 to 70.

plotChr(Experiment, 1, "EIC", xlim=c(7,7.5), mz=c(50,54,70))  #Plots
# the EIC from minute 7 to 7.5, and only the masses 50, 54 and 70.

## End(No test)


