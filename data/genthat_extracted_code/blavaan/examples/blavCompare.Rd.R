library(blavaan)


### Name: blavCompare
### Title: Bayesian model comparisons.
### Aliases: blavCompare BF

### ** Examples

## Not run: 
##D hsm1 <- ' visual  =~ x1 + x2 + x3 + x4
##D           textual =~ x4 + x5 + x6
##D           speed   =~ x7 + x8 + x9 '
##D 
##D fit1 <- bcfa(hsm1, data=HolzingerSwineford1939)
##D 
##D hsm2 <- ' visual  =~ x1 + x2 + x3
##D           textual =~ x4 + x5 + x6 + x7
##D           speed   =~ x7 + x8 + x9 '
##D 
##D fit2 <- bcfa(hsm2, data=HolzingerSwineford1939)
##D 
##D blavCompare(fit1, fit2)
## End(Not run)



