library(REEMtree)


### Name: plot
### Title: Plot the RE-EM tree
### Aliases: plot.REEMtree
### Keywords: tree hplot

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
plot(REEMresult)



