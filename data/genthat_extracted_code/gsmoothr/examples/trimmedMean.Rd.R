library(gsmoothr)


### Name: trimmedMean
### Title: Trimmed Mean Smoother
### Aliases: trimmedMean

### ** Examples


sp <- seq(100, 1000, by=100)
ss <- seq(100,1000, by=50)
set.seed(14)
x <- rnorm(length(sp))

tmC <- trimmedMean(sp, x, probeWindow=300, nProbes=5)



