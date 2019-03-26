library(localIV)


### Name: mprte
### Title: Estimation of Marginal Policy Relevant Treatment Effects (MPRTE)
### Aliases: mprte

### ** Examples

mte_fit <- mte(selection = d ~ x + z, outcome = y ~ x,
  method = "localIV", data = toydata)

mprte1 <- mprte(mte_fit, policy = function(p) 1)
mprte2 <- mprte(mte_fit, policy = function(p) p)
mprte3 <- mprte(mte_fit, policy = function(p) I(p<0.2))
c(mprte1, mprte2, mprte3)




