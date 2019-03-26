library(feisr)


### Name: summary.feis
### Title: Summary for feis objects
### Aliases: summary.feis

### ** Examples

data("mwp", package = "feisr")
feis.mod <- feis(lnw ~ marry | exp,
                 data = mwp, id = "id")
summary(feis.mod)



