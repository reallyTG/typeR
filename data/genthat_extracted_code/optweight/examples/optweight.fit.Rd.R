library(optweight)


### Name: optweight.fit
### Title: Fitting Function for Optweight
### Aliases: optweight.fit

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

treat.list <- list(lalonde$treat)
covs.list <- list(splitfactor(lalonde[2:8], drop.first = "if2"))
tols.list <- list(rep(.01, ncol(covs.list[[1]])))

ow.fit <- optweight.fit(treat.list,
                        covs.list,
                        tols = tols.list,
                        estimand = "ATE",
                        norm = "l2")



