library(cocorresp)


### Name: rescale
### Title: Rescales CoCA species scores
### Aliases: rescale rescale.default rescale.symcoca
### Keywords: multivariate

### ** Examples

## Don't show: 
od <- options(digits = 4)
## End(Don't show)
data(bryophyte)
data(vascular)

bryo.sym <- coca(bryophyte ~ ., data = vascular, method = "symmetric")

## No test: 
rescale(bryo.sym, axes = 1:2)
## End(No test)
## Don't show: 
options(od)
## End(Don't show)



