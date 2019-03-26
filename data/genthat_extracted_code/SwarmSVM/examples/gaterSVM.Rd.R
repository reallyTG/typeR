library(SwarmSVM)


### Name: gaterSVM
### Title: Mixture SVMs with gater function
### Aliases: gaterSVM

### ** Examples


data(svmguide1)
svmguide1.t = as.matrix(svmguide1[[2]])
svmguide1 = as.matrix(svmguide1[[1]])
gaterSVM.model = gaterSVM(x = svmguide1[,-1], y = svmguide1[,1], hidden = 10, seed = 0,
                          m = 10, max.iter = 1, learningrate = 0.01, threshold = 1, stepmax = 100,
                          valid.x = svmguide1.t[,-1], valid.y = svmguide1.t[,1], verbose = FALSE)
table(gaterSVM.model$valid.pred,svmguide1.t[,1])
gaterSVM.model$valid.score




