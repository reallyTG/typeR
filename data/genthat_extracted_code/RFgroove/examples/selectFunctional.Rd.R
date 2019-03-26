library(RFgroove)


### Name: selectFunctional
### Title: Grouped variable selection procedure for functional data
### Aliases: selectFunctional

### ** Examples

  data(toyRegFD)
  varSel <- selectFunctional( toyRegFD$FDlist, toyRegFD$Y, normalize=FALSE, 
                              dimensionReductionMethod="fpca", nbasisInit=16, 
                              verbose=FALSE, ntree=10)
  summary(varSel)
  plot(varSel)



