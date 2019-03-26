library(Tmisc)


### Name: Thist
### Title: Histograms with overlays
### Aliases: Thist
### Keywords: NA

### ** Examples

set.seed(42)
x <- rnorm(1000, mean=5, sd=2)
Thist(x)
Thist(x, overlay="density")
Thist(x^2)
Thist(x^2, overlay="density", breaks=50, col="lightblue2")




