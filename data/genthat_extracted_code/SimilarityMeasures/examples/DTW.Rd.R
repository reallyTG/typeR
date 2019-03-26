library(SimilarityMeasures)


### Name: DTW
### Title: Run the Dynamic Time Warping Algorithm on Two Trajectories
### Aliases: DTW

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the dynamic time warping algorithm with point spacing 
# set to 4.
DTW(path1, path2, 4)



