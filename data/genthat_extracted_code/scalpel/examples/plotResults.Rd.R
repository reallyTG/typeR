library(scalpel)


### Name: plotResults
### Title: Plot both the spatial and temporal components from Step 3 of
###   SCALPEL.
### Aliases: plotResults

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #assumes you have run the example for the "scalpel" function
##D 
##D #simplest example with default parameters:
##D plotResults(scalpelOutput = scalpelOutput)
##D 
##D #example with optional parameters:
##D #plot only two of the neurons, do not number neurons, draw the outlines of the neurons
##D plotResults(scalpelOutput = scalpelOutput, neuronsToDisplay = c(1,2),
##D            number = FALSE, border = TRUE)
## End(Not run)



