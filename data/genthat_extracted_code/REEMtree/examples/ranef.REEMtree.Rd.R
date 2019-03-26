library(REEMtree)


### Name: ranef.REEMtree
### Title: Extract the estimated random effects from a RE-EM tree
### Aliases: ranef.REEMtree
### Keywords: models

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
ranef(REEMresult)



