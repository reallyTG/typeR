library(sos)


### Name: PackageSum2
### Title: Add Info from Installed Packages to PackageSummary
### Aliases: PackageSum2 PackageSum2.findFn PackageSum2.data.frame
###   PackageSum2.list
### Keywords: package

### ** Examples

##
## data.frame method
##
Tstdf <- data.frame(Package=c('grid', 'base'), 
            stringsAsFactors=FALSE)
Tst2 <- PackageSum2(Tstdf)

##
## list method
##
TstList <- list(PackageSummary=Tstdf)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(Tst2, PackageSum2(TstList))
## Don't show: 
)
## End(Don't show)

##
## findFn method
##
Tst.findFn <- data.frame(
    Package=c('grid', 'base')[c(1,1,2)], 
    Score=2:4, Date=LETTERS[1:3], stringsAsFactors=FALSE)
attr(Tst.findFn, 'PackageSummary') <- PackageSummary(
    Tst.findFn)
class(Tst.findFn) <- c('findFn', 'data.frame')
Tst2. <- PackageSum2(Tst.findFn)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(Tst2, Tst2.[names(Tst2)])
## Don't show: 
)
## End(Don't show)




