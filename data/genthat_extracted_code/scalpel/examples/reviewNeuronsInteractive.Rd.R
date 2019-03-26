library(scalpel)


### Name: reviewNeuronsInteractive
### Title: Manually classify the identified neurons from SCALPEL.
### Aliases: reviewNeuronsInteractive

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #assumes you have run the example for the "scalpel" function
##D 
##D #we review the set of spatial components from Step 2,
##D #which are contained in scalpelOutput$A
##D reviewNeuronsInteractive(scalpelOutput = scalpelOutput, neuronSet = "A")
##D #enter "Y" for the first neuron and then "Q"
##D #entering "Q" allows us to finish manually classifying later using the same command
##D #this time there are fewer left to review
##D reviewNeuronsInteractive(scalpelOutput = scalpelOutput, neuronSet = "A")
##D #enter "N" for the first and "?" for the second this time
##D #note that once a neuron is classified as "N", it disappears from the plot
## End(Not run)



