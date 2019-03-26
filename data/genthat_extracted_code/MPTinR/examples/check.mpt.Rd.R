library(MPTinR)


### Name: check.mpt
### Title: Check construction of MPT models.
### Aliases: check.mpt
### Keywords: models tree

### ** Examples

# model of example 1 from example(fit.mpt)
model1 <- system.file("extdata", "rb.fig1.model", package = "MPTinR")
check.mpt(model1)

#model 1 in eqn format
model1.eqn <- system.file("extdata", "rb.fig1.model.eqn", package = "MPTinR")
check.mpt(model1.eqn)



#models of example 2 from example(fit.mpt)
model2 <- system.file("extdata", "rb.fig2.model", package = "MPTinR")
check.mpt(model2)

model2r.r.eq <- system.file("extdata", "rb.fig2.r.equal", package = "MPTinR")
check.mpt(model2, model2r.r.eq)

model2r.c.eq <- system.file("extdata", "rb.fig2.c.equal", package = "MPTinR")
check.mpt(model2, model2r.c.eq)




