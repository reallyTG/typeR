library(ManlyMix)


### Name: Manly.Kmeans
### Title: k-means algorithm with Manly transformation
### Aliases: Manly.Kmeans
### Keywords: k-means Manly transformation CEM algorithm

### ** Examples


set.seed(123)

K <- 3; p <- 4
X <- as.matrix(iris[,-5])
id.true <- rep(1:K, each = 50)

# Obtain initial memberships based on the traditional K-means algorithm
id.km <- kmeans(X, K)$cluster

# Run the CEM algorithm for k-means with Manly transformation based on traditional k-means solution
la <- matrix(0.1, K, p)
B <- Manly.Kmeans(X, id.km, la)
id.Manly <- B$id

ClassAgree(id.Manly, id.true)




