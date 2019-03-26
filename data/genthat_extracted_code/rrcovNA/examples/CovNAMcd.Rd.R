library(rrcovNA)


### Name: CovNAMcd
### Title: Robust Location and Scatter Estimation via MCD for incomplete
###   data
### Aliases: CovNAMcd
### Keywords: robust multivariate

### ** Examples

    data(bush10)
    mcd <- CovNAMcd(bush10)
    mcd
    summary(mcd)

    plot(mcd)
    plot(mcd, which="pairs")
    plot(mcd, which="xydistance")
    plot(mcd, which="xyqqchi2")   



