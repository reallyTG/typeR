library(evd)


### Name: plot.bvevd
### Title: Plot Diagnostics for a Bivariate EVD Object
### Aliases: plot.bvevd
### Keywords: hplot

### ** Examples

bvdata <- rbvevd(100, dep = 0.6, model = "log")
M1 <- fbvevd(bvdata, model = "log")
## Not run: par(mfrow = c(2,2))
## Not run: plot(M1, which = 1:5)
## Not run: plot(M1, mar = 1)
## Not run: plot(M1, mar = 2)



