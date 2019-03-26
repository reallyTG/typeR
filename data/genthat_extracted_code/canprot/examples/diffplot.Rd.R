library(canprot)


### Name: diffplot
### Title: Plot Compositional Differences
### Aliases: diffplot

### ** Examples

data(canprot)
comptab <- lapply(c("JKMF10", "WDO+15_C.N"), function(dataset) {
  pdat <- get_pdat(dataset)
  get_comptab(pdat)
})
diffplot(comptab)



