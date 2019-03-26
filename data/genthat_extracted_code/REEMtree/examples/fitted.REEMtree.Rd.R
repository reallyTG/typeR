library(REEMtree)


### Name: fitted.REEMtree
### Title: Extract the fitted values from a RE-EM tree
### Aliases: fitted.REEMtree
### Keywords: models

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
fitted(REEMresult)



