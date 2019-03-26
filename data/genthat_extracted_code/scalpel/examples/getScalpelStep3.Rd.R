library(scalpel)


### Name: getScalpelStep3
### Title: Read in results from Step 3 of SCALPEL.
### Aliases: getScalpelStep3

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #assumes you have run the example for the "scalpel" function
##D #folder where results were saved
##D outputFolder = "scalpelResults"
##D 
##D #read previous results in
##D #simplest example with default parameters:
##D out = getScalpelStep3(outputFolder = outputFolder)
##D #note: if Step 1 has been run more than once, will need to specify 'version'
##D 
##D #example with optional parameters:
##D #need to enter if non-default options were used
##D out = getScalpelStep3(outputFolder = outputFolder, omega = 0.2, cutoff = 0.18,
##D                      alpha = 0.9, minClusterSize = 1)
## End(Not run)



