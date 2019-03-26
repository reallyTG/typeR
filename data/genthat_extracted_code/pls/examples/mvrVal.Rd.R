library(pls)


### Name: mvrVal
### Title: MSEP, RMSEP and R2 of PLSR and PCR models
### Aliases: MSEP MSEP.mvr RMSEP RMSEP.mvr R2 R2.mvr mvrValstats
### Keywords: regression multivariate

### ** Examples

data(oliveoil)
mod <- plsr(sensory ~ chemical, ncomp = 4, data = oliveoil, validation = "LOO")
RMSEP(mod)
## Not run: plot(R2(mod))



