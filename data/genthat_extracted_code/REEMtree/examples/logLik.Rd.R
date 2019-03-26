library(REEMtree)


### Name: logLik
### Title: Log-likelihood of a RE-EM tree
### Aliases: logLik.REEMtree
### Keywords: models tree

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
logLik(REEMresult)



