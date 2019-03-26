library(scalpel)


### Name: plotBrightest
### Title: Plot the most active frames for a given neuron.
### Aliases: plotBrightest

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #assumes you have run the example for the "scalpel" function
##D #simplest example with default parameters:
##D plotBrightest(scalpelOutput = scalpelOutput, AfilterIndex = 2)
##D 
##D #example with optional parameters:
##D #only outline neuron corresponding to frame, plot 5th brightest with raw data
##D plotBrightest(scalpelOutput = scalpelOutput, AfilterIndex = 2, videoType = "raw",
##D              neuronsToOutline = "main", brightIndex = 5)
##D 
##D #same plot but if you have video data read in already
##D #using 'getY' function, you can provide it
##D rawY = getY(scalpelOutput = scalpelOutput, videoType = "raw")
##D plotBrightest(scalpelOutput = scalpelOutput, AfilterIndex = 2, Y = rawY,
##D              neuronsToOutline = "main", brightIndex = 5)
## End(Not run)



