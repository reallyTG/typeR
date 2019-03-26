library(SCBmeanfd)


### Name: plot.SCBand
### Title: Plot a SCBand Object
### Aliases: plot.SCBand
### Keywords: methods

### ** Examples

## Not run: 
##D ## Plasma citrate data 
##D time <- 8:21
##D data(plasma)
##D h <- cv.select(time, plasma, degree = 1, interval = c(.5, 1))
##D scbplasma <- scb.mean(time, plasma, bandwidth = h, scbtype = "both",
##D                       gridsize = 100)
##D plot(scbplasma, cex = .2, legend.cex = .85, xlab = "Time of day", 
##D      ylab = "Concentration", main = "Plasma citrate data")
## End(Not run)



