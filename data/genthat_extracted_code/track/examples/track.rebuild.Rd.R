library(track)


### Name: track.rebuild
### Title: Rebuild database information for tracked objects
### Aliases: track.rebuild
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

# Rebuild a damaged tracking database
library(track)
# first build a tracking dir populated with some variables
track.start(dir=file.path(tempdir(), 'rdatadir7'))
x <- 33
X <- array(1:24, dim=2:4)
Y <- list(a=1:3,b=2)
X[2] <- -1
abc <- "def"
def <- list(1,2,3)
invisible(Y); invisible(abc); invisible(abc); invisible(abc)
track.summary()
track.stop(pos=1)
# damage the database (remove the filemap)
unlink(file.path(tempdir(), 'rdatadir7', 'filemap.txt'))
# and rebuild
track.rebuild(dir=file.path(tempdir(), 'rdatadir7'), verbose=2, dryRun=FALSE, fix=TRUE)
track.start(file.path(tempdir(), 'rdatadir7'))
track.summary()
track.status()
# Would normally not call track.stop(), but do so here to clean up after
# running this example.
track.stop(pos=1, keepVars=TRUE)



