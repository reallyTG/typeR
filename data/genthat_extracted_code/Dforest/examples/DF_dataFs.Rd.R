library(Dforest)


### Name: DF_dataFs
### Title: Decision Forest algorithm: Feature Selection in pre-processing
### Aliases: DF_dataFs

### ** Examples

 ##data(iris)
  X = iris[iris[,5]!="setosa",1:4]
  Y = iris[iris[,5]!="setosa",5]
  used_feat = DF_dataFs(X, Y)



