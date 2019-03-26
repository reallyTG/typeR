library(cocorresp)


### Name: resid.symcoca
### Title: Extract Model Residuals
### Aliases: resid.symcoca
### Keywords: multivariate

### ** Examples

## Don't show: 
od <- options(digits = 4)
## End(Don't show)
data(bryophyte)
data(vascular)
bryo.sym <- coca(bryophyte ~ ., data = vascular, method = "symmetric")
eps <- resid(bryo.sym)
## Don't show: 
options(od)
## End(Don't show)



