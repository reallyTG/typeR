library(MPTinR)


### Name: make.mpt.cf
### Title: Functions to transform MPT models.
### Aliases: make.mpt.cf lbmpt.to.mpt

### ** Examples

model2 <- system.file("extdata", "rb.fig2.model", package = "MPTinR")

make.mpt.cf(model2)

make.mpt.cf(model2, treewise = TRUE)
  
lbmpt.to.mpt(make.mpt.cf(model2, treewise = TRUE))



