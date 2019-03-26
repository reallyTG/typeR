library(Oncotree)


### Name: error.rates<-
### Title: Set the error rates of an oncotree manually
### Aliases: error.rates<-
### Keywords: models

### ** Examples

  data(ov.cgh)
  ov.tree <- oncotree.fit(ov.cgh)
  ov.tree
  error.rates(ov.tree) <- c(0,0)
  ov.tree



