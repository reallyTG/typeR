library(REEMtree)


### Name: print
### Title: Print a RE-EM Tree object
### Aliases: print.REEMtree
### Keywords: print tree

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
print(REEMresult)



