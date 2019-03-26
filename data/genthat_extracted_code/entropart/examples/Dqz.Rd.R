library(entropart)


### Name: Dqz
### Title: Similarity-based diversity of a community
### Aliases: Dqz bcDqz Dqz.ProbaVector Dqz.AbdVector Dqz.integer
###   Dqz.numeric

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Prepare the similarity matrix
DistanceMatrix <- as.matrix(Paracou618.dist)
# Similarity can be 1 minus normalized distances between species
Z <- 1 - DistanceMatrix/max(DistanceMatrix)
# Calculate diversity of order 2
Dqz(Paracou618.MC$Ns, 2, Z)



