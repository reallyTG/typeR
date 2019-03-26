library(psych)


### Name: factor.stats
### Title: Find various goodness of fit statistics for factor analysis and
###   principal components
### Aliases: factor.stats fa.stats
### Keywords: multivariate models

### ** Examples

v9 <- sim.hierarchical()
f3 <- fa(v9,3)
factor.stats(v9,f3,n.obs=500)
f3o <- fa(v9,3,fm="pa",rotate="Promax")
factor.stats(v9,f3o,n.obs=500)





