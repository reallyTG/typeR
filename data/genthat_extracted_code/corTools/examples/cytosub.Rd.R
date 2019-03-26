library(corTools)


### Name: cytosub
### Title: Dataset Subsetter
### Aliases: cytosub

### ** Examples

# Create sample dataset
source.interaction <- c("R1", "R2", "R3", "E1", "E2")
target.interaction <- c("L1", "L2", "L4", "E6", "E7")
values.interaction <- c(1.42, 14.34, 6.43, 32.1, 15.8)
dataset <- cbind(source.interaction, target.interaction, values.interaction)

cytosub(dataset, source.interaction, target.interaction, E)
# dataset indicates the data we are working with
# source.interaction and target.interaction denote the columns of the dataset
# E indicates the text that we want to search for and edit out of the dataset
# function will return the dataset without "E1", "E2", "E6", "E7"



