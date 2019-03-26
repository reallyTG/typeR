library(RcppGSL)


### Name: fastLm
### Title: Bare-bones linear model fitting function
### Aliases: fastLm fastLmPure fastLm.default fastLm.formula
### Keywords: regression

### ** Examples

  data(trees, package="datasets")

  ## bare-bones direct interface
  flm <- fastLmPure( cbind(1, log(trees$Girth)), log(trees$Volume) )
  print(flm)

  ## standard R interface for formula or data returning object of class fastLm
  flmmod <- fastLm( log(Volume) ~ log(Girth), data=trees)
  summary(flmmod)




