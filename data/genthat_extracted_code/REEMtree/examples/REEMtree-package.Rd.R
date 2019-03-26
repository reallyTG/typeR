library(REEMtree)


### Name: REEMtree-package
### Title: Regression Trees with Random Effects for Longitudinal (Panel)
###   Data
### Aliases: REEMtree-package
### Keywords: tree

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
print(REEMresult)



