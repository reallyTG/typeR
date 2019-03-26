library(MALDIquant)


### Name: binPeaks
### Title: Align Peaks into discrete bins.
### Aliases: binPeaks
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## create two MassPeaks objects
p <- list(createMassPeaks(mass=seq(100, 500, 100), intensity=1:5),
          createMassPeaks(mass=c(seq(100.2, 300.2, 100), 395), intensity=1:4))

binnedPeaks <- binPeaks(p, tolerance=0.002)

## compare result
iM1 <- intensityMatrix(p)
iM2 <- intensityMatrix(binnedPeaks)

all(dim(iM1) == c(2, 9)) # TRUE
all(dim(iM2) == c(2, 6)) # TRUE

show(iM2)

## increase tolerance
binnedPeaks <- binPeaks(p, tolerance=0.1)

iM3 <- intensityMatrix(binnedPeaks)

all(dim(iM3) == c(2, 5)) # TRUE

show(iM3)

## differences between "strict" and "relaxed"
p <- c(createMassPeaks(mass=c(1, 1.01, 3), intensity=c(2, 1, 1)),
       createMassPeaks(mass=c(0.99, 3), intensity=rep(1, 2)),
       createMassPeaks(mass=c(1.02, 3), intensity=rep(1, 2)))

intensityMatrix(binPeaks(p, method="strict", tolerance=0.05))
intensityMatrix(binPeaks(p, method="relaxed", tolerance=0.05))



