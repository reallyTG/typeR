### R code from vignette source 'track.Rnw'

###################################################
### code chunk number 1: track.Rnw:44-49
###################################################
library(track)
track.start()
# Good to go, variables will be saved as they are created.
# Not necessary, but if you want to stop tracking, do this:
track.stop()


###################################################
### code chunk number 2: track.Rnw:56-76
###################################################
library(track)
track.start()
x <- 123                  # Variable 'x' is now tracked
y <- matrix(1:6, ncol=2)  # 'y' is assigned & tracked
z1 <- list("a", "b", "c")
z2 <- Sys.time()
track.summary()           # See a summary of tracked vars
# (TA="total accesses", TW="total writes")
ls(all=TRUE)
track.stop()              # Stop tracking
ls(all=TRUE)

# Restart using the tracking dir -- the variables reappear
track.start() # Start using the same tracking dir again ("rdatadir")
ls(all=TRUE)
track.summary()
track.stop()

# the files in the tracking directory:
list.files("rdatadir", all=TRUE)


###################################################
### code chunk number 3: track.Rnw:80-81
###################################################
unlink('rdatadir', recursive=TRUE)


###################################################
### code chunk number 4: track.Rnw:130-131
###################################################
track.history.start()


###################################################
### code chunk number 5: track.Rnw:135-136
###################################################
track.history.stop()


