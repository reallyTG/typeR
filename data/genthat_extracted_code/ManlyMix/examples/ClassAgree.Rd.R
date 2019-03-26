library(ManlyMix)


### Name: ClassAgree
### Title: Calculates the confusion matrix and number of misclassifications
### Aliases: ClassAgree
### Keywords: Manly mixture EM algorithm Forward and backward selection

### ** Examples


set.seed(123)

K <- 3; p <- 4
X <- as.matrix(iris[,-5])
id.true <- rep(1:K, each = 50)

# Obtain initial memberships based on the K-means algorithm
id.km <- kmeans(X, K)$cluster

ClassAgree(id.km, id.true)



