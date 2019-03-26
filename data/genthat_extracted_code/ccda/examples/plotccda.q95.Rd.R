library(ccda)


### Name: plotccda.q95
### Title: CCDA density drawer
### Aliases: plotccda.q95

### ** Examples


result<-ccda.main(iris[,1:4] , iris[,5],  500, c("setosa","versicolor",
"virginica"), "proportions", return.RCDP=TRUE)
plotccda.q95(result)
plotccda.q95(result, pl=2)




