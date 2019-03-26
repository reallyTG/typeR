library(metagen)


### Name: joinPivotalCoefficients
### Title: Pivotal distributions: Extract pivots for regression
###   coefficients
### Aliases: joinPivotalCoefficients

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_s <- bcg$size
bcg_x <- cbind(1,bcg$x)

set.seed(865287113)
pivUn <- pivotalStream(50, y=bcg_y, d=bcg_d, x=bcg_x,
  adjusted=FALSE)
set.seed(865287113)
  pivAd <- pivotalStream(50, y=bcg_y, d=bcg_d, x=bcg_x, s=bcg_s,
adjusted=TRUE)

pivr <- joinPivotalCoefficients(pivUn, pivAd)



