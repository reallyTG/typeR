library(track)


### Name: track.info
### Title: Return filenames and directories for tracked variables.
### Aliases: track.filename track.datadir track.info track.mem
###   env.is.tracked tracked.envs
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
track.start(dir=file.path(tempdir(), 'rdatadir4'))
x <- 33
X <- array(1:24, dim=2:4)
Y <- list(a=1:3,b=2)
X[2] <- -1
track.datadir(relative=TRUE)
track.datadir(relative=FALSE)
track.filename(list=c("x", "X"))
track.info()
track.mem()
env.is.tracked(pos=1)
env.is.tracked(pos=2)
# Would normally not call track.stop(), but do so here to clean up after
# running this example.
track.stop(pos=1, keepVars=TRUE)



