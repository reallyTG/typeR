library(MALDIquant)


### Name: monoisotopicPeaks-methods
### Title: Finds monoisotopic peaks in a MassPeaks object.
### Aliases: monoisotopicPeaks monoisotopicPeaks,MassPeaks-method
###   monoisotopicPeaks,list-method
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create example peaks
p <- createMassPeaks(mass=995:1005,
                     intensity=c(100, 10, 30, 10, 40, # noise
                                 550, 330, 110, 10,   # isotopic pattern
                                 5, 15))              # more noise
m <- monoisotopicPeaks(p)
as.matrix(m)

## plot the peaks and mark the monoisotopic one
plot(p)
points(m, col=2, pch=4)



