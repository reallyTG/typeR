library(HistogramTools)


### Name: ASH
### Title: Average Shifted Histograms From a Histogram.
### Aliases: HistToASH
### Keywords: nonparametric

### ** Examples

x <- runif(1000, min=0, max=100)
h <- hist(x, breaks=0:100, plot=FALSE)
plot(h, freq=FALSE)

# Superimpose the Average Shifted Histogram on top of the original.
lines(HistToASH(h), col="red")



