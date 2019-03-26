library(evd)


### Name: plot.bvpot
### Title: Plot Diagnostics for a Bivariate POT EVD Object
### Aliases: plot.bvpot
### Keywords: hplot

### ** Examples

bvdata <- rbvevd(500, dep = 0.6, model = "log")
M1 <- fbvpot(bvdata, threshold = c(0,0), model = "log")
## Not run: plot(M1)
## Not run: plot(M1, mar = 1)
## Not run: plot(M1, mar = 2)



