library(geneSignatureFinder)


### Name: NCPUS
### Title: Wrapper function to both makeCluster() and detecCore() functions
###   of the 'parallel' library.
### Aliases: NCPUS

### ** Examples

# to count how many cpu's are on the localhost, run
detectCores()

# we suggest to set a cluster of maximal dimension -1 to leave a cpu to control the system
aMakeCluster <- makeCluster(2)
stopCluster(aMakeCluster)





