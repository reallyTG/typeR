library(plm)


### Name: aneweytest
### Title: Chamberlain estimator and test for fixed effects
### Aliases: aneweytest summary.aneweytest print.summary.aneweytest
### Keywords: aneweytest

### ** Examples

data("RiceFarms", package = "plm")
aneweytest(log(goutput) ~ log(seed) + log(totlabor) + log(size), RiceFarms, index = "id")



