library(entropart)


### Name: Optimal.Similarity
### Title: Optimal scale parameter to transform a distance matrix into a
###   similarity matrix
### Aliases: Optimal.Similarity

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Prepare the similarity matrix. The square root of Paracou618.dist is euclidean.
optimal <- Optimal.Similarity(sqrt(Paracou618.dist))
# Optimal scale
optimal$u
# Calculate diversity of order 2
bcDqz(Paracou618.MC$Ns, 2, optimal$Matrix)



