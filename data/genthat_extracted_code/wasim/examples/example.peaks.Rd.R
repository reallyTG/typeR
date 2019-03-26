library(wasim)


### Name: example.peaks
### Title: Synthetic peak errors
### Aliases: example.peaks reference.peak
### Keywords: datasets

### ** Examples

data(example.peaks)
str(example.peaks)
str(reference.peak)
plot(reference.peak,type="line")
lines(example.peaks[,1], lty=2)
require(tiger)
diagnostic_dawson(measured = reference.peak, modelled = example.peaks[1,])
## maybe str(peaks) ; plot(peaks) ...



