library(caret)


### Name: knn3
### Title: k-Nearest Neighbour Classification
### Aliases: knn3 knn3.formula knn3.matrix knn3.data.frame knn3Train
###   print.knn3
### Keywords: multivariate

### ** Examples


irisFit1 <- knn3(Species ~ ., iris)

irisFit2 <- knn3(as.matrix(iris[, -5]), iris[,5])

data(iris3)
train <- rbind(iris3[1:25,,1], iris3[1:25,,2], iris3[1:25,,3])
test <- rbind(iris3[26:50,,1], iris3[26:50,,2], iris3[26:50,,3])
cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
knn3Train(train, test, cl, k = 5, prob = TRUE)




