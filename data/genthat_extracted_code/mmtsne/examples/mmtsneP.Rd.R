library(mmtsne)


### Name: mmtsneP
### Title: Multiple maps t-SNE with symmetric probability matrix
### Aliases: mmtsneP

### ** Examples

# Load the iris dataset
data("iris")

# Produce a symmetric joint probability matrix
prob_matrix <- p2sp(x2p(as.matrix(iris[,1:4])))

# Estimate a mmtsne model with 2 maps, 2 dimensions each
model <- mmtsneP(prob_matrix, no_maps=2, max_iter=100)

# Plot the results side-by-side for inspection
# Points scaled by map proportion weights plus constant factor
par(mfrow=c(1,2))
plot(model$Y[,,1], col=iris$Species, cex=model$proportions[,1] + 0.2)
plot(model$Y[,,2], col=iris$Species, cex=model$proportions[,2] + 0.2)
par(mfrow=c(1,1))




