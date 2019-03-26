library(ManlyMix)


### Name: Manly.EM
### Title: EM algorithm for Manly mixture model
### Aliases: Manly.EM
### Keywords: Manly mixture EM algorithm Forward and backward selection

### ** Examples


set.seed(123)

K <- 3; p <- 4
X <- as.matrix(iris[,-5])
id.true <- rep(1:K, each = 50)

# Obtain initial memberships based on the K-means algorithm
id.km <- kmeans(X, K)$cluster

# Run the EM algorithm for a Gaussian mixture model based on K-means solution
A <- Manly.EM(X, id.km)
id.Gauss <- A$id

ClassAgree(id.Gauss, id.true)

# Run the EM algorithm for a Manly mixture model based on Gaussian mixture solution
la <- matrix(0.1, K, p)
B <- Manly.EM(X, id.Gauss, la)
id.Manly <- B$id

ClassAgree(id.Manly, id.true)




