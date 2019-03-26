library(datadr)


### Name: recombine
### Title: Recombine
### Aliases: recombine

### ** Examples

## in-memory example
##---------------------------------------------------------

# begin with an in-memory ddf (backed by kvMemory)
bySpecies <- divide(iris, by = "Species")

# create a function to calculate the mean for each variable
colMean <- function(x) data.frame(lapply(x, mean))

# apply the transformation
bySpeciesTransformed <- addTransform(bySpecies, colMean)

# recombination with no 'combine' argument and no argument to output
# produces the key-value list produced by 'combCollect()'
recombine(bySpeciesTransformed)

# but we can also preserve the distributed data frame, like this:
recombine(bySpeciesTransformed, combine = combDdf)

# or we can recombine using 'combRbind()' and produce a data frame:
recombine(bySpeciesTransformed, combine = combRbind)

## local disk connection example with parallelization
##---------------------------------------------------------

# create a 2-node cluster that can be used to process in parallel
cl <- parallel::makeCluster(2)

# create the control object we'll pass into local disk datadr operations
control <- localDiskControl(cluster = cl)
# note that setting options(defaultLocalDiskControl = control)
# will cause this to be used by default in all local disk operations

# create local disk connection to hold bySpecies data
ldPath <- file.path(tempdir(), "by_species")
ldConn <- localDiskConn(ldPath, autoYes = TRUE)

# convert in-memory bySpecies to local-disk ddf
bySpeciesLD <- convert(bySpecies, ldConn)

# apply the transformation
bySpeciesTransformed <- addTransform(bySpeciesLD, colMean)

# recombine the data using the transformation
bySpeciesMean <- recombine(bySpeciesTransformed,
  combine = combRbind, control = control)
bySpeciesMean

# remove temporary directories
unlink(ldPath, recursive = TRUE)

# shut down the cluster
parallel::stopCluster(cl)



