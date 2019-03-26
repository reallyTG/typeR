library(plm)


### Name: piest
### Title: Chamberlain estimator and test for fixed effects
### Aliases: piest summary.piest print.summary.piest
### Keywords: piest

### ** Examples

data("RiceFarms", package = "plm")
pirice <- piest(log(goutput) ~ log(seed) + log(totlabor) + log(size), RiceFarms, index = "id")
summary(pirice)



