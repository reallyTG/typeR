library(ChainLadder)


### Name: MultiChainLadder-class
### Title: Class "MultiChainLadder" of Multivariate Chain-Ladder Results
### Aliases: MultiChainLadder-class $,MultiChainLadder-method
###   [[,MultiChainLadder,numeric,missing-method
###   [[,MultiChainLadder,character,missing-method
###   coef,MultiChainLadder-method fitted,MultiChainLadder-method
###   names,MultiChainLadder-method residuals,MultiChainLadder-method
###   resid,MultiChainLadder-method rstandard,MultiChainLadder-method
###   show,MultiChainLadder-method vcov,MultiChainLadder-method
### Keywords: classes

### ** Examples

# example for class "MultiChainLadder"
data(liab)
fit.liab <-  MultiChainLadder(Triangles = liab)
fit.liab

names(fit.liab)
fit.liab[[1]]
fit.liab$model
fit.liab@model

do.call("rbind",coef(fit.liab))
vcov(fit.liab)[[1]]
residCov(fit.liab)[[1]]
head(do.call("rbind",rstandard(fit.liab)))




