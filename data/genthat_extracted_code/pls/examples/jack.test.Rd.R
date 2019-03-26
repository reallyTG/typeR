library(pls)


### Name: jack.test
### Title: Jackknife approximate t tests of regression coefficients
### Aliases: jack.test print.jacktest
### Keywords: htest

### ** Examples

data(oliveoil)
mod <- pcr(sensory ~ chemical, data = oliveoil, validation = "LOO", jackknife = TRUE)
jack.test(mod, ncomp = 2)



