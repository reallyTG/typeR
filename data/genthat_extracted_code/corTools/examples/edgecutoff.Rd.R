library(corTools)


### Name: edgecutoff
### Title: Identifies Hubs
### Aliases: edgecutoff

### ** Examples

# Create some sample data
traits <- c("Trait1", "Trait2", "Trait3", "Trait4", "Trait5")
edgecount <- c(5, 6, 7, 4, 23)
example <- cbind(traits, edgecount)

edgecutoff(example, edgecount)
# example denotes the data
# edgecount denotes the column of the data that you want to cutoff at
# returns Trait5   23 and a boxplot of the data into the graphics window



