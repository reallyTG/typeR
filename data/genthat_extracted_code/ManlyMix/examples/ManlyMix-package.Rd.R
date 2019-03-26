library(ManlyMix)


### Name: ManlyMix-package
### Title: Finite mixture modeling and model-based clustering based on
###   Manly mixture models.
### Aliases: ManlyMix-package

### ** Examples


set.seed(123)

K <- 3; p <- 4
X <- as.matrix(iris[,-5])
id.true <- rep(1:K, each = 50)

# Obtain initial memberships based on the K-means algorithm
id.km <- kmeans(X, K)$cluster

# Run the CEM algorithm for Manly K-means model
la <- matrix(0.1, K, p)
C <- Manly.Kmeans(X, id = id.km, la = la)

# Run the EM algorithm for a Gaussian mixture model based on K-means solution
G <- Manly.EM(X, id = id.km)
id.G <- G$id

# Run FORWARD SELECTION ('silent' is on)
F <- Manly.select(X, model = G, method = "forward", silent = TRUE)

# Run the EM algorithm for a full Manly mixture model based on Gaussian mixture solution
la <- matrix(0.1, K, p)
M <- Manly.EM(X, id = id.G, la = la)

# Run BACKWARD SELECTION ('silent' is off)
B <- Manly.select(X, model = M, method = "backward")

BICs <- c(G$bic, M$bic, F$bic, B$bic)
names(BICs) <- c("Gaussian", "Manly", "Forward", "Backward")
BICs



