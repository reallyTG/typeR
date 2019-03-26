library(SCBmeanfd)


### Name: scb.mean
### Title: Build Simultaneous Confidence Bands for Mean Functions
### Aliases: scb.mean

### ** Examples

## Not run: 
##D ## Plasma citrate data
##D data(plasma)
##D time <- 8:21
##D h <- cv.select(time, plasma, 1, c(.5, 1))
##D scbplasma <- scb.mean(time, plasma, bandwidth = h, scbtype = "both", gridsize = 100)
##D scbplasma
##D plot(scbplasma, cex = .2, legend.cex = .85, xlab = "Time", ylab = "Concentration", 
##D   main = "Plasma citrate data")
## End(Not run)



