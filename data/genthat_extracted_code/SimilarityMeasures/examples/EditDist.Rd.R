library(SimilarityMeasures)


### Name: EditDist
### Title: Run the Edit Distance Algorithm on Two Trajectories
### Aliases: EditDist

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the edit distance algorithm with point distance 
# set to 2.
EditDist(path1, path2, 2)



