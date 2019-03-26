library(metagen)


### Name: plotDensityH2
### Title: Pivotal distributions: Plot pivot density of the heterogeneity
### Aliases: plotDensityH2

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_x <- cbind(1,bcg$x)

set.seed(865287113)
pivUn <- pivotalStream(50, y=bcg_y, d=bcg_d, x=bcg_x,
  adjusted=FALSE)
pivh  <- joinPivotalHeterogeneity(pivUn)
plotDensityH2(pivh)



