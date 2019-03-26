library(DVHmetrics)


### Name: getIsoEffD
### Title: Isoeffective dose calculation
### Aliases: getIsoEffD getIsoEffD.default getIsoEffD.DVHs
###   getIsoEffD.DVHLst getIsoEffD.DVHLstLst

### ** Examples

# reference: 70Gy in 2Gy fractions
# new fractionation: 3Gy fractions
# calculate corresponding dose
(D2 <- getIsoEffD(D1=70, fd1=2, fd2=3, ab=c(3.5, 10)))

getIsoEffD(D1=dataMZ[[c(1, 1)]], fd1=1.8, fd2=2, ab=3.5)



