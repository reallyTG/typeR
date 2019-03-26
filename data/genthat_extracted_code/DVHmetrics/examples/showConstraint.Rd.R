library(DVHmetrics)


### Name: showConstraint
### Title: Display constraints for cumulative dose-volume histograms
### Aliases: showConstraint showConstraint.DVHs showConstraint.DVHLst
###   showConstraint.DVHLstLst

### ** Examples

data(dataMZ)

# define constraints
constr <- data.frame(
    patID=c("P123", "P234"),
    structure=c("HEART", "*"),
    constraint=c("D1CC < 20Gy", "V10% > 8CC"),
    stringsAsFactors=FALSE)       # this is important
showConstraint(dataMZ, constr=constr, byPat=FALSE)



