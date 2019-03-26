library(feisr)


### Name: feistest
### Title: Artificial Regression Test
### Aliases: feistest

### ** Examples

data("mwp", package = "feisr")
feis.mod <- feis(lnw ~ marry + enrol | year,
                 data = mwp, id = "id", robust = TRUE)
ht <- feistest(feis.mod, robust = TRUE, type = "all")
summary(ht)



