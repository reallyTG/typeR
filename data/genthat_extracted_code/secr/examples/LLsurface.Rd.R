library(secr)


### Name: LLsurface
### Title: Plot Likelihood Surface
### Aliases: LLsurface LLsurface.secr
### Keywords: hplot

### ** Examples


## Not run: 
##D 
##D LLsurface(secrdemo.CL, xval = seq(0.16,0.40,0.02),
##D     yval = 25:35, nlevels = 20)
##D 
##D ## now verify MLE
##D ## click on MLE and apparent `peak'
##D xy <- locator(2)
##D temp <- LLsurface(secrdemo.CL, xval = xy$x,
##D      yval = xy$y, plot = FALSE)
##D temp
## End(Not run)



