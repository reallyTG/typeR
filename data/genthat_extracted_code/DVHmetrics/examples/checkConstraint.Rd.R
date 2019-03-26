library(DVHmetrics)


### Name: checkConstraint
### Title: Check constraints on dose-volume histograms (DVH)
### Aliases: checkConstraint checkConstraint.DVHs checkConstraint.DVHLst
###   checkConstraint.DVHLstLst

### ** Examples

res <- checkConstraint(dataMZ, c("D10CC < 10Gy", "V20Gy < 20%"))
head(res)

# define constraints
constr <- data.frame(
    patID=c("P123", "P234"),
    structure=c("HEART", "*"),
    constraint=c("D1CC < 20Gy", "V10% > 8CC"),
    stringsAsFactors=FALSE)       # this is important
checkConstraint(dataMZ, constr=constr)



