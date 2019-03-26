library(REEMtree)


### Name: residuals.REEMtree
### Title: Extract the residuals from a RE-EM tree
### Aliases: residuals.REEMtree
### Keywords: models

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
residuals(REEMresult)



