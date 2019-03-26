library(FNN)


### Name: knn.cv
### Title: k-Nearest Neighbour Classification Cross-Validation
### Aliases: knn.cv
### Keywords: classif nonparametric

### ** Examples

  data(iris3)
  train <- rbind(iris3[,,1], iris3[,,2], iris3[,,3])
  cl <- factor(c(rep("s",50), rep("c",50), rep("v",50)))
  knn.cv(train, cl, k = 3, prob = TRUE)
  attributes(.Last.value)



