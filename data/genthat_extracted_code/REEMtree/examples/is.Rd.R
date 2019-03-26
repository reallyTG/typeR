library(REEMtree)


### Name: is
### Title: Is a RE-EM tree object
### Aliases: is.REEMtree
### Keywords: tree models classes

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
is.REEMtree(REEMresult)



