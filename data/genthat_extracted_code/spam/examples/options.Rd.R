library(spam)


### Name: options
### Title: Options Settings
### Aliases: options.spam getOption.spam
### Keywords: IO environment error print

### ** Examples

smat <- diag.spam( 1:8)
smat
options(spam.printsize=49)
smat

# Reset to default values:
options(spam.eps=.Machine$double.eps,
        spam.drop=FALSE,             
        spam.printsize=100,
        spam.imagesize=10000,
        spam.cex=1200, 
        spam.structurebased=FALSE,
        spam.inefficiencywarning=1e6,
        spam.trivalues=FALSE,
        spam.listmethod="PE", 
        spam.NAOK=FALSE,
        spam.safemodevalidity=TRUE,
        spam.dopivoting=TRUE, 
        spam.cholsymmetrycheck=TRUE,
        spam.cholpivotcheck=TRUE,
        spam.cholupdatesingular="warning",
        spam.cholincreasefactor=c(1.25,1.25),
        spam.nearestdistincreasefactor=1.25,
        spam.nearestdistnnz=c(400^2,400))




