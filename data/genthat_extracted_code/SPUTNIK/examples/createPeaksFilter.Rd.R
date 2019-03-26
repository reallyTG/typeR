library(SPUTNIK)


### Name: createPeaksFilter
### Title: Generate a peak filter object.
### Aliases: createPeaksFilter

### ** Examples

library("SPUTNIK")
mz <- seq(100, 195, 5)
mzIdx <- sample(100, 20)
names(mzIdx) <- mz
peaksFilter <- createPeaksFilter(mzIdx)




