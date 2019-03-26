library(track)


### Name: track.options
### Title: Set and get tracking options on a tracked environment
### Aliases: track.options
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

library(track)
track.start(dir=file.path(tempdir(), 'rdatadir6'))
x <- 33
X <- array(1:24, dim=2:4)
track.status()
track.options(cache=TRUE, writeToDisk=FALSE) # change for just this session
# different ways of retrieving option values
track.options(c("cache", "writeToDisk"))
track.options("cache", "writeToDisk")
track.options("cache")
track.options()
# see the effect of the changed options on the status of X (X is not saved to disk)
track.status()
X[1,1,1] <- 0
track.status()
track.flush()
track.status()
track.stop(pos=1)
track.start(dir=file.path(tempdir(), 'rdatadir6'))
# note that options previously changed are back at defaults (because default
# to track.options() is save=FALSE
track.options(c("cache", "writeToDisk"))
track.options(cache=TRUE, writeToDisk=FALSE, save=TRUE) # change the options on disk
track.options(c("cache", "writeToDisk"))
track.stop(pos=1)
track.start(dir=file.path(tempdir(), 'rdatadir6'))
# now options previously changed are remembered (because track.options(..., save=TRUE) was used)
track.options(c("cache", "writeToDisk"))
track.stop(pos=1, keepVars=TRUE)



