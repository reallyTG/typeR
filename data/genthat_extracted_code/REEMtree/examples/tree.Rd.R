library(REEMtree)


### Name: tree
### Title: Extract the regression tree associated with a RE-EM tree
### Aliases: tree tree.REEMtree
### Keywords: models tree

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
tree.REEMtree(REEMresult)
tree(REEMresult)



