library(ppclust)


### Name: pca
### Title: Possibilistic Clustering Algorithm
### Aliases: pca
### Keywords: cluster

### ** Examples

# Load dataset X16
data(x16)
x <- x16[,-3]

# Initialize the prototype matrix using K-means++
v <- inaparc::kmpp(x, k=2)$v
# Initialize the membership degrees matrix 
u <- inaparc::imembrand(nrow(x), k=2)$u

# Run PCA
pca.res <- pca(x, centers=v, memberships=u, m=2, eta=2)

# Display the fuzzy membership degrees 
print(round(pca.res$u,2))

# Display the typicality degrees
print(round(pca.res$t,2))



