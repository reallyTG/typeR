library(ccda)


### Name: plotccda.results
### Title: Plot of the results of ccda.main
### Aliases: plotccda.results

### ** Examples


result<-ccda.main(iris[,1:4] , iris[,5],  500, c("setosa","versicolor",
"virginica"),"proportions", return.RCDP=FALSE)
plotccda.results(result)




