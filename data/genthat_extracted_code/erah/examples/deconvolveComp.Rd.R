library(erah)


### Name: deconvolveComp
### Title: Deconvolution of compounds in samples
### Aliases: deconvolveComp

### ** Examples

## No test: 
# Deconvolve data from a created experiment by newExp().
ex <- newExp(instrumental="path")

# The following will set eRah for analyzing the chromatograms
# from minutes 5 to 15, and withouth taking into account the masses
# 35:69,73:75,147:149, with a minimum peak widht of 0.7 seconds.

ex.dec.par <- setDecPar(min.peak.width=0.7, min.peak.height=5000, 
noise.threshold=500, avoid.processing.mz=c(35:69,73:75,147:149), 
analysis.time=c(5,15))

# An now deconvolve the compounds in the samples:
ex <- deconvolveComp(ex, decParameters=ex.dec.par)
## End(No test)



