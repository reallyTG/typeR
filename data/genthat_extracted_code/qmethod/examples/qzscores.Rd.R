library(qmethod)


### Name: qzscores
### Title: Q methodology: z-scores from loadings
### Aliases: qzscores

### ** Examples

data(lipset)
library(psych)
loa <- as.data.frame(unclass(principal(lipset[[1]], 
                     nfactors = 3, rotate = "varimax")$loadings))
flagged <- qflag(nstat = 33, loa = loa)
qmzsc <- qzscores(lipset[[1]], nfactors = 3, flagged = flagged, loa = loa)
qmzsc # Show results



