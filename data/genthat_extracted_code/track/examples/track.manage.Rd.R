library(track)


### Name: track.manage
### Title: Manage how objects are handled in a tracking session
### Aliases: track track.assign untrack track.remove track.save
###   track.resave track.flush track.forget track.load
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
track.start(dir=file.path(tempdir(), 'rdatadir5'))
x <- 33
X <- array(1:24, dim=2:4)
Y <- list(a=1:3,b=2)
X[2] <- -1
track.summary(time=0, access=1, size=FALSE)
y1 <- 2
y2 <- 3
z1 <- 4
z2 <- 5
z3 <- 6
untracked()
track.summary(time=0, access=1, size=FALSE)
ls(all=TRUE)
track.stop(pos=1)
ls(all=TRUE)
a <- 7
b <- 8
save(list=c("a", "b"), file=file.path(tempdir(), "ab.rda"))
remove(list=c("a", "b"))
track.start(dir=file.path(tempdir(), 'rdatadir5'))
track.summary(time=0, access=1, size=FALSE)
track.load(file.path(tempdir(), "ab.rda"))
track.summary(time=0, access=1, size=FALSE)
track.status()
# Would normally not call track.stop(), but do so here to clean up after
# running this example.
track.stop(pos=1, keepVars=TRUE)



