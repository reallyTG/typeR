library(simPop)


### Name: simple_dis
### Title: Simple generation of new variables
### Aliases: simple_dis univariate.dis conditional.dis univariate.dis
###   conditional.dis

### ** Examples

## we don't have original data, so let's use eusilc
data(eusilc13puf)
data(eusilcS)
v1 <- univariate.dis(eusilcS, eusilc13puf, additional = "db040",
weights = "rb050", value = "vector")
table(v1)
table(eusilc13puf$db040)
## we don't have original data, so let's use eusilc
##data(eusilc13puf)
##data(eusilcS)
##v1 <- conditional.dis(eusilcS, eusilc13puf, additional = "pb190",
##  conditional = "db040", weights = "rb050")
##table(v1) / sum(table(v1))
##table(eusilc13puf$pb190) / sum(table(eusilc13puf$pb190))



