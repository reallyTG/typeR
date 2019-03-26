library(SCBmeanfd)


### Name: summary.SCBand
### Title: Summarize a SCBand Object
### Aliases: summary.SCBand
### Keywords: methods

### ** Examples

## Not run: 
##D ## Plasma citrate data 
##D data(plasma)
##D time <- 8:21
##D h <- cv.select(time, plasma, 1)
##D scbplasma <- scb.mean(time, plasma, bandwidth = h, scbtype = "both", gridsize = 100)
##D summary(scbplasma)
## End(Not run)



