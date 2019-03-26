library(sdcTable)


### Name: attack
### Title: attacking primary suppressed cells and calculating current lower
###   and upper bounds
### Aliases: attack

### ** Examples

# load problem (as it was created after performing primary suppression
# in the example of \code{primarySuppression})
sp <- searchpaths()
fn <- paste(sp[grep("sdcTable", sp)], "/data/problemWithSupps.RData", sep="")
problem <- get(load(fn))

# calculate current lower|upper bounds given current suppression pattern
# (in this case consisting of primary suppressions only)
attack(problem, verbose=FALSE)



