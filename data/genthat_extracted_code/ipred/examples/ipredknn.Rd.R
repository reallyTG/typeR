library(ipred)


### Name: ipredknn
### Title: k-Nearest Neighbour Classification
### Aliases: ipredknn
### Keywords: multivariate

### ** Examples


library("mlbench")
learn <- as.data.frame(mlbench.twonorm(300))

mypredict.knn <- function(object, newdata) 
                   predict.ipredknn(object, newdata, type="class")

errorest(classes ~., data=learn, model=ipredknn, 
         predict=mypredict.knn)





