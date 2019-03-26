library(GCalignR)


### Name: simple_chroma
### Title: Simulate simple chromatograms
### Aliases: simple_chroma

### ** Examples

## create a chromatogram
x <- simple_chroma(peaks = c(5,10,15), N = 1, min = 0, max = 30, Names = "MyChroma")
## plot chromatogram
with(x, plot(x,y, xlab = "time", ylab = "intensity"))




