library(gama)


### Name: gama.plot.partitions
### Title: Plots results of a Gama clustering.
### Aliases: gama.plot.partitions
### Keywords: file

### ** Examples

# loads path.based dataset
library(gama)
data(path.based)

# the gama clustering algorithm call
gamaObj <- gama(path.based, k = 2, generations = 30)
# ** use at least 100 generations for simple datasets and 500 for complex datasets

# a call to gama.plot.partitions function with "Principal Component Analysis" view method
gama.plot.partitions(gamaObj)

# a call to gama.plot.partitions
## Not run: gama.plot.partitions(gamaObj)



