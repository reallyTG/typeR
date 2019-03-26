library(stemmatology)


### Name: PCC.contam
### Title: PCC Exploratory Methods: Contamination Detection
### Aliases: PCC.contam
### Keywords: stemmatology

### ** Examples

# load a data set
data("fournival")
## Don't show: 
# subsetting for exec time
fournival = fournival[1:200,c(-5,-8)]
## End(Don't show)
# identify conflicts on a subset
x = PCC.conflicts(fournival)
# identify problematic variant locations
x = PCC.overconflicting(x, ask = FALSE, threshold = 0.06)
# eliminate them
x = PCC.elimination(x)
# examinate the rest of the problematic cases, to detect
# plausible contaminations
PCC.contam(x)



