library(sdcTable)


### Name: primarySuppression
### Title: perform primary suppression in 'sdcProblem-class'-objects
### Aliases: primarySuppression

### ** Examples

# load micro data
sp <- searchpaths()
fn <- paste(sp[grep("sdcTable", sp)], "/data/microData1.RData", sep="")
microData <- get(load(fn))

# load problem (as it was created in the example in \code{makeProblem})
fn <- paste(sp[grep("sdcTable", sp)], "/data/problem.RData", sep="")
problem <- get(load(fn))

# we have a look at the frequency table by gender and region
xtabs(rep(1, nrow(microData)) ~ gender + region, data=microData)

# cell with region=='A' and gender=='female' has 2 units contributing to it
# this cell should be considered sensitive according the the freq-rule with 'maxN' equal to 2!
p1 <- primarySuppression(problem, type='freq', maxN=2)

# we can also apply a p-percent rule with parameter 'p' being 30 as below.
# This is only possible if we are dealing with micro data and we also have to specify the index of
# a numeric variable.
p2 <- primarySuppression(problem, type='p', p=30, numVarInd=1)

# looking at anonymization states we see, that one cell is primary suppressed (sdcStatus=='u')
# and the remaining cells are possible candidates for secondary suppression (sdcStatus=='s') given
# the frequency rule with parameter 'maxN=2'.
# Applying the p-percent rule with parameter 'p=30' resulted in two primary suppressions.
data.frame(p1.sdc=getInfo(p1, type='sdcStatus'), p2.sdc=getInfo(p2, type="sdcStatus"))




