library(kernlab)


### Name: ranking-class
### Title: Class "ranking"
### Aliases: ranking-class edgegraph convergence convergence,ranking-method
###   edgegraph,ranking-method show,ranking-method
### Keywords: classes

### ** Examples

data(spirals)

## create data set to be ranked
ran<-spirals[rowSums(abs(spirals)<0.55)==2,]

## rank points according to "relevance" to point 54 (up left)
ranked<-ranking(ran,54,kernel="rbfdot",
                kpar=list(sigma=100),edgegraph=TRUE)

ranked
edgegraph(ranked)[1:10,1:10]



