library(feisr)


### Name: feis
### Title: Fixed Effects Individual Slope Estimator
### Aliases: feis

### ** Examples

data("mwp", package = "feisr")
feis.mod <- feis(lnw ~ marry + enrol + as.factor(yeargr) | exp + I(exp^2),
                 data = mwp, id = "id", robust = TRUE)
summary(feis.mod)



