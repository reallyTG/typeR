library(scalpel)


### Name: plotSpatial
### Title: Plot spatial components from Steps 2 or 3 of SCALPEL.
### Aliases: plotSpatial

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #assumes you have run the example for the "scalpel" function
##D 
##D #simplest example with default parameters:
##D plotSpatial(scalpelOutput = scalpelOutput, neuronSet = "Afilter")
##D 
##D #example with optional parameters:
##D #plot only two of the neurons, add a title, do not number neurons,
##D #and draw the outlines of the neurons
##D plotSpatial(scalpelOutput = scalpelOutput, neuronsToDisplay = c(1,2), neuronSet = "Afilter",
##D            title = "First two neurons", number = FALSE, border = TRUE)
## End(Not run)



