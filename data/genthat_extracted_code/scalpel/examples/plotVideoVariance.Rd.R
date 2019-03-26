library(scalpel)


### Name: plotVideoVariance
### Title: Plot a summary of the fluorescence in the video.
### Aliases: plotVideoVariance

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #assumes you have run the example for the "scalpel" function
##D 
##D #simplest example with default parameters:
##D plotVideoVariance(scalpelOutput = scalpelOutput, neuronSet = "Afilter")
##D 
##D #example with optional parameters:
##D #previous showed summary of processed data,
##D #can instead show raw data, not outline the neurons found, and add a title
##D plotVideoVariance(scalpelOutput = scalpelOutput, videoType = "raw",
##D                  neuronsToOutline = "none", title = "Raw Data")
##D 
##D #if you have video data read in already using 'getY' function, you can provide it
##D rawY = getY(scalpelOutput = scalpelOutput, videoType = "raw")
##D plotVideoVariance(scalpelOutput = scalpelOutput, neuronSet = "Afilter", Y = rawY)
## End(Not run)



