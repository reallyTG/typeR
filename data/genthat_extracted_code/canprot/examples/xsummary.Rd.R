library(canprot)


### Name: xsummary
### Title: Summarize Compositional Differences
### Aliases: xsummary

### ** Examples

data(canprot)
comptab <- lapply(c("JKMF10", "WDO+15_C.N"), function(dataset) {
  pdat <- get_pdat(dataset)
  get_comptab(pdat)
})
xsummary(comptab)



