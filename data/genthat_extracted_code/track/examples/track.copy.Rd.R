library(track)


### Name: track.copy
### Title: Copy or move objects from one tracking db to another
### Aliases: track.copy track.move
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
# Track two environments and transfer objects from one to the other.
# Use tmp dirs for the tracking dbs.
track.start(dir=file.path(tempdir(), 'rdatadir2'))
track.attach(dir=file.path(tempdir(), 'rdatadir3'), pos=2, create=TRUE)
assign("x1", 1, pos=2)
assign("x2", 2, pos=2)
assign("y3", 3, pos=2)
assign("y4", 4, pos=2)
assign("z5", 5)
track.status(1)
track.status(2)
track.copy(from=2, pat="^x", clobber=TRUE)
ls(1)
ls(2)
track.move(from=2, pat="^y", clobber=TRUE)
track.move(from=1, to=2, pat="^z", clobber=TRUE)
ls(1)
ls(2)
c(x1, x2, y3, y4)
track.move(from=2, pat="^x", clobber=TRUE)
ls(1)
ls(2)
c(x1, x2, y3, y4)
track.status(1)
track.status(2)
track.detach(2)
# Would normally not call track.stop(), but do so here to clean up after
# running this example.
track.stop(keepVars=TRUE)



