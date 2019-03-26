library(feisr)


### Name: bsfeistest
### Title: Bootstrapped Regression Test
### Aliases: bsfeistest

### ** Examples

data("mwp", package = "feisr")
feis.mod <- feis(lnw ~ marry + enrol | year,
                 data = mwp, id = "id", robust = TRUE)
bsht <- bsfeistest(feis.mod, type = "bs1", rep = 5, seed = 1234, prog = FALSE)
summary(bsht)



