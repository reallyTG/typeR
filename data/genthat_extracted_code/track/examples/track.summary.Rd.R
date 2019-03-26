library(track)


### Name: track.summary
### Title: Return a summary of the basic properties of tracked objects
### Aliases: track.summary
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
track.start(dir=file.path(tempdir(), 'rdatadir11'))
x <- 33
X <- array(1:24, dim=2:4)
Y <- list(a=1:3,b=2)
X[2] <- -1
y1 <- 2
y2 <- 3
track.summary()
track.summary(time=0, access=1, size=FALSE)
track.summary(X)
track.summary(list=c("x", "X"))
track.summary(pattern="[xX]")
# Would normally not call track.stop(), but do so here to clean up after
# running this example.
track.stop(pos=1, keepVars=TRUE)



