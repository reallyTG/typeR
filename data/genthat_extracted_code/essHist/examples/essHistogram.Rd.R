library(essHist)


### Name: essHistogram
### Title: The Essential Histogram
### Aliases: essHistogram
### Keywords: distribution nonparametric

### ** Examples

# simulate data
set.seed(123)
n = 300
x = rnorm(n)

# compute the essential histogram
eh = essHistogram(x, xname = "Gauss")



