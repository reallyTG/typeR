library(metagen)


### Name: plotDensityH
### Title: Pivotal distributions: Plot pivotal distribution of
###   heterogeneity
### Aliases: plotDensityH

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

pivh <- joinPivotalHeterogeneity(pivUn, pivAd)
plotDensityH(pivh)



