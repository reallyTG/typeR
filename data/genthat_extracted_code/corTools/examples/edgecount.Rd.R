library(corTools)


### Name: edgecount
### Title: Edge counter
### Aliases: edgecount

### ** Examples

# Create a sample dataset
Interaction1 <- c("L1", "L2", "L3", "L4", "L19", "R7", "L2")
Interaction2 <- c("L1", "L9", "R1", "R2", "R7", "L4", "R10")
dat <- as.data.frame(cbind(Interaction1, Interaction2))

edgecount(dat, Interaction1, Interaction2)
# dat denotes the name of the data frame
# Interaction1 and Interaction2 denote the column names of the dataframe that contain the
# traits whose interactions you want to count
# function returns a list of unique traits and their frequency of appearance
# Example: L1 only appears once, so it is L1   1
# L4 appears twice, so it is L4   2



