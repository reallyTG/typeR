library(track)


### Name: track.status
### Title: Return information about the status of tracking
### Aliases: track.status track.dir tracked untracked untrackable
###   track.unsaved track.orphaned track.masked
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
track.start(dir=file.path(tempdir(), 'rdatadir10'))
x1 <- 123
x2 <- 456
x3 <- 789
track.status()
rm(x3)
track.status()
# Would normally not call track.stop(), but do so here to clean up after
# running this example.
track.stop(pos=1, keepVars=1)



