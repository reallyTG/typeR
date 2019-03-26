library(paleoMAS)


### Name: simulat.t
### Title: Model desaturation by samples simulation
### Aliases: simulat.t
### Keywords: manip datagen

### ** Examples

data(quexilper)
colnames(quexilper)
# Cyperaceae and spores are left out of the pollen sum.
# For absolute abundance data
simulat.t(quexilper,percenta=FALSE,last=73)
# or
simulat.t(quexilper,last=73)$samples.t
# For percentages data
simulat.t(quexilper,last=73)$percentages



