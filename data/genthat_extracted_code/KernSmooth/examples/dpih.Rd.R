library(KernSmooth)


### Name: dpih
### Title: Select a Histogram Bin Width
### Aliases: dpih
### Keywords: smooth

### ** Examples

data(geyser, package="MASS")
x <- geyser$duration
h <- dpih(x)
bins <- seq(min(x)-h, max(x)+h, by=h)
hist(x, breaks=bins)



