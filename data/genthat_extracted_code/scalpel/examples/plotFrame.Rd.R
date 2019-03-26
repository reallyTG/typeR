library(scalpel)


### Name: plotFrame
### Title: Plot a frame of the video.
### Aliases: plotFrame

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #assumes you have run the example for the "scalpel" function
##D 
##D #simplest example with default parameters:
##D plotFrame(scalpelOutput = scalpelOutput, frame = 100)
##D 
##D #example with optional parameters:
##D #plot raw data instead of processed
##D plotFrame(scalpelOutput = scalpelOutput, frame = 100, videoType = "raw")
##D 
##D #same plot but if you have video data read in already
##D #using 'getY' function, you can provide it
##D rawY = getY(scalpelOutput = scalpelOutput, videoType = "raw")
##D plotFrame(scalpelOutput = scalpelOutput, frame = 100, Y = rawY)
## End(Not run)



