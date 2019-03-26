library(track)


### Name: track.rename
### Title: Rename variables in a tracked environment
### Aliases: track.rename
### Keywords: data

### ** Examples

##############################################################
# Warning: running this example will cause variables currently
# in the R global environment to be written to .RData files
# in a tracking database on the filesystem under R's temporary
# directory, and will cause the variables to be removed temporarily
# from the R global environment.
# It is recommended to run this example with a fresh R session
# with no important variables in the global environment.
##############################################################

track.start(dir=file.path(tempdir(), 'rdatadir8'))
a <- 1
b <- rep(2, 2)
track.rename(c("a", "b"), c("b", "a"), clobber=TRUE)
c(a, b)
# Would normally not call track.stop(), but do so here to clean up after
# running this example.
track.stop(keepVars=TRUE)



