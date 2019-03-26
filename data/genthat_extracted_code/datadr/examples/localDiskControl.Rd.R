library(datadr)


### Name: localDiskControl
### Title: Specify Control Parameters for MapReduce on a Local Disk
###   Connection
### Aliases: localDiskControl

### ** Examples

# create a 2-node cluster that can be used to process in parallel
cl <- parallel::makeCluster(2)
# create a local disk control object that specifies to use this cluster
# these operations run in parallel
control <- localDiskControl(cluster = cl)
# note that setting options(defaultLocalDiskControl = control)
# will cause this to be used by default in all local disk operations

# convert in-memory ddf to local-disk ddf
ldPath <- file.path(tempdir(), "by_species")
ldConn <- localDiskConn(ldPath, autoYes = TRUE)
bySpeciesLD <- convert(divide(iris, by = "Species"), ldConn)

# update attributes using parallel cluster
updateAttributes(bySpeciesLD, control = control)

# remove temporary directories
unlink(ldPath, recursive = TRUE)

# shut down the cluster
parallel::stopCluster(cl)



