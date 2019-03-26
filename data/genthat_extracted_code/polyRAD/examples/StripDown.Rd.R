library(polyRAD)


### Name: StripDown
### Title: Remove Unneeded Slots to Conserve Memory
### Aliases: StripDown StripDown.RADdata
### Keywords: manip

### ** Examples

# load a dataset for this example
data(exampleRAD)

# run a pipeline
exampleRAD <- IterateHWE(exampleRAD)

# check the size of the resulting object
object.size(exampleRAD)

# remove unneeded slots
exampleRAD <- StripDown(exampleRAD)

# check object size again
object.size(exampleRAD)



