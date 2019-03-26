library(altmeta)


### Name: metahet
### Title: Meta-Analysis Heterogeneity Measures
### Aliases: metahet

### ** Examples

data("aex")
set.seed(1234)
attach(aex)
metahet(y, s2, 100)
#metahet(y, s2, 1000)
detach(aex)

data("hipfrac")
set.seed(1234)
attach(hipfrac)
metahet(y, s2, 100)
#metahet(y, s2, 1000)
detach(hipfrac)



