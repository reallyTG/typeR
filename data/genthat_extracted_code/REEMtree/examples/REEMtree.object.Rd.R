library(REEMtree)


### Name: REEMtree.object
### Title: Random Effects/Expectation Maximization (RE-EM) Tree Object
### Aliases: REEMtree.object
### Keywords: tree models

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)



