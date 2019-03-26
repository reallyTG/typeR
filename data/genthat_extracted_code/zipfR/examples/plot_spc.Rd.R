library(zipfR)


### Name: plot.spc
### Title: Plot Word Frequency Spectra (zipfR)
### Aliases: plot.spc
### Keywords: hplot

### ** Examples

 
## load Italian ultra- prefix data
data(ItaUltra.spc)

## plot spectrum
plot(ItaUltra.spc)

## logarithmic scale for m (more elements are plotted)
plot(ItaUltra.spc, log="x")

## just lines
plot(ItaUltra.spc, log="x", points=FALSE)

## just the first five elements, then the first 100
plot(ItaUltra.spc, m.max=5)
plot(ItaUltra.spc, m.max=100, log="x")

## compute zm model and expeccted spectrum
zm <- lnre("zm", ItaUltra.spc)
zm.spc <- lnre.spc(zm, N(ItaUltra.spc))

## compare observed and expected spectra (also
## in black and white to print on papers)
plot(ItaUltra.spc, zm.spc, legend=c("observed", "expected"))
plot(ItaUltra.spc, zm.spc, legend=c("observed", "expected"), bw=TRUE)
plot(ItaUltra.spc, zm.spc, legend=c("observed", "expected"), log="x")
plot(ItaUltra.spc, zm.spc, legend=c("observed", "expected"), log="x", bw=TRUE)

## re-generate expected spectrum with variances
zm.spc <- lnre.spc(zm, N(ItaUltra.spc), variances=TRUE)

## now 95% ci is shown in log plot
plot(zm.spc, log="x")

## different title and labels
plot(zm.spc, log="x", main="Expected Spectrum with Confidence Interval",
     xlab="spectrum elements", ylab="expected type counts")




