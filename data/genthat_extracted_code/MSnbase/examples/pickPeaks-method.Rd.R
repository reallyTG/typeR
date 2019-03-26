library(MSnbase)


### Name: pickPeaks-methods
### Title: Peak Detection for 'MSnExp' or 'Spectrum' instances
### Aliases: pickPeaks-methods pickPeaks
### Keywords: methods

### ** Examples

sp1 <- new("Spectrum1",
           intensity = c(1:6, 5:1),
           mz = 1:11,
           centroided = FALSE)
sp2 <- pickPeaks(sp1)
intensity(sp2)

data(itraqdata)
itraqdata2 <- pickPeaks(itraqdata)
processingData(itraqdata2)


## Examples for refineMz:
ints <- c(5, 3, 2, 3, 1, 2, 4, 6, 8, 11, 4, 7, 5, 2, 1, 0, 1, 0, 1, 1, 1, 0)
mzs <- 1:length(ints)
sp1 <- new("Spectrum1", intensity = ints, mz = mzs, centroided = FALSE)
plot(mz(sp1), intensity(sp1), type = "h")

## Without m/z refinement:
sp2 <- pickPeaks(sp1)           
points(mz(sp2), intensity(sp2), col = "darkgrey")
## Using k = 1, closest signals
sp3 <- pickPeaks(sp1, refineMz = "kNeighbors", k = 1)           
points(mz(sp3), intensity(sp3), col = "green", type = "h")

## Using descendPeak requiring at least 50% or the centroid's intensity
sp4 <- pickPeaks(sp1, refineMz = "descendPeak", signalPercentage = 50)           
points(mz(sp4), intensity(sp4), col = "red", type = "h")
           



