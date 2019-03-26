library(ChemoSpec)


### Name: clupaSpectra
### Title: Hierarchical Cluster-Based Peak Alignment on a Spectra Object
### Aliases: clupaSpectra
### Keywords: utilities

### ** Examples


data(alignMUD)

plotSpectra(alignMUD, which = 1:20, lab.pos = 4.5, offset = 0.1,
  yrange = c(0, 1900), amp = 500, xlim = c(1.5, 1.8),
  main = "Misaligned NMR Spectra (alignMUD)")

aMUD <- clupaSpectra(alignMUD)
plotSpectra(aMUD, which = 1:20, lab.pos = 4.5, offset = 0.1,
  yrange = c(0, 1900), amp = 500, xlim = c(1.5, 1.8),
  main = "Aligned NMR Spectra (alignMUD)")





