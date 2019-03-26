library(qtl)


### Name: formMarkerCovar
### Title: Create matrix of marker covariates for QTL analysis
### Aliases: formMarkerCovar
### Keywords: utilities

### ** Examples

data(hyper)
hyper <- calc.genoprob(hyper, step=0)
peakMarker <- "D4Mit164"
X <- formMarkerCovar(hyper, peakMarker)
## Don't show: 
hyper <- hyper[c(1,4),]
## End(Don't show)
out <- scanone(hyper, addcovar=X)



