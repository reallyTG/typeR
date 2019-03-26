library(SwarmSVM)


### Name: dcSVM
### Title: Divide-and-Conquer kernel SVM (DC-SVM)
### Aliases: dcSVM

### ** Examples

data(svmguide1)
svmguide1.t = as.matrix(svmguide1[[2]])
svmguide1 = as.matrix(svmguide1[[1]])
dcsvm.model = dcSVM(x = svmguide1[,-1], y = svmguide1[,1],
                    k = 4, max.levels = 4, seed = 0, cost = 32, gamma = 2,
                    kernel = 3,early = 0, m = 800,
                    valid.x = svmguide1.t[,-1], valid.y = svmguide1.t[,1])
preds = dcsvm.model$valid.pred
table(preds, svmguide1.t[,1])
dcsvm.model$valid.score




