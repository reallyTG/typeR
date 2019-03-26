library(ks)


### Name: plot.kfs
### Title: Plot for kernel feature significance
### Aliases: plot.kfs
### Keywords: hplot

### ** Examples

## No test: 
library(MASS)
data(geyser)
geyser.fs <- kfs(geyser, binned=TRUE)
plot(geyser.fs)
## End(No test)


