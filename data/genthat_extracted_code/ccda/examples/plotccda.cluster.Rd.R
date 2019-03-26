library(ccda)


### Name: plotccda.cluster
### Title: Plot of the basic grouping
### Aliases: plotccda.cluster

### ** Examples


result<-ccda.main(iris[,1:4] , iris[,5],  500, c("setosa","versicolor",
"virginica"),"proportions",return.RCDP=FALSE)
plotccda.cluster(result)




