library(scalpel)


### Name: plotThresholdedFrame
### Title: Plot a frame of the video with shading.
### Aliases: plotThresholdedFrame

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #assumes you have run the example for the "scalpel" function
##D 
##D #simplest example with default parameters:
##D plotThresholdedFrame(scalpelOutput = scalpelOutput, frame = 100,
##D                     threshold = scalpelOutput$thresholdVec[1])
##D 
##D #example with optional parameters:
##D #change shading to purple and add a title
##D plotThresholdedFrame(scalpelOutput = scalpelOutput, frame = 100, col = "purple",
##D                    threshold = scalpelOutput$thresholdVec[2])
##D 
##D #if you have video data read in already using 'getY' function, you can provide it
##D processedY = getY(scalpelOutput = scalpelOutput, videoType = "processed")
##D plotThresholdedFrame(scalpelOutput = scalpelOutput, frame = 100,
##D                     threshold = scalpelOutput$thresholdVec[1], Y = processedY)
## End(Not run)



