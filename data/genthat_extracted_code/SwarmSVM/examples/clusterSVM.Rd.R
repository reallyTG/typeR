library(SwarmSVM)


### Name: clusterSVM
### Title: Clustered Support Vector Machine
### Aliases: clusterSVM

### ** Examples

data(svmguide1)
svmguide1.t = svmguide1[[2]]
svmguide1 = svmguide1[[1]]

csvm.obj = clusterSVM(x = svmguide1[,-1], y = svmguide1[,1], lambda = 1,
                      centers = 8, seed = 512, verbose = 0,
                      valid.x = svmguide1.t[,-1],valid.y = svmguide1.t[,1])
csvm.pred = csvm.obj$valid.pred

# Or predict from the data
pred = predict(csvm.obj, svmguide1.t[,-1])




