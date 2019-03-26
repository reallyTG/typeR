library(sos)


### Name: packageSum
### Title: Add Info from Installed Packages to PackageSummary
### Aliases: packageSum packageSum.findFn packageSum.data.frame
###   packageSum.list
### Keywords: package

### ** Examples

##
## data.frame method
##
tstdf <- data.frame(Package=c('grid', 'base'), 
            stringsAsFactors=FALSE)
tst2 <- packageSum(tstdf)

##
## list method
##
tstList <- list(PackageSummary=tstdf)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst2, packageSum(tstList))
## Don't show: 
)
## End(Don't show)
##
## findFn method
##
tst.findFn <- data.frame(
    Package=c('grid', 'base')[c(1,1,2)], 
    Score=2:4, Date=LETTERS[1:3], stringsAsFactors=FALSE)
attr(tst.findFn, 'PackageSummary') <- 
    PackageSummary(tst.findFn)
class(tst.findFn) <- c('findFn', 'data.frame')
tst2. <- packageSum(tst.findFn)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst2, tst2.[names(tst2)])
## Don't show: 
)
## End(Don't show)
##
## spline example 
##
splineHelp <- findFn("spline", maxPages = 2)
splinePkgs <- packageSum(splineHelp)



