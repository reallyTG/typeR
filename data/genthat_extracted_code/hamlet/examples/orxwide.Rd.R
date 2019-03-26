library(hamlet)


### Name: orxwide
### Title: Wide-format baseline data for the ORX study
### Aliases: orxwide
### Keywords: datasets

### ** Examples

data(orxwide)
# Construct an example distance matrix based on conventional 
# Euclidean distance and the baseline characteristics
d.orx <- dist(orxwide[,c("Volume", "PSA", "High", "BodyWeight", "PSAChange")])
# Plot a hierarchical clustering of the individuals
plot(hclust(d=d.orx))
# This 'd.orx' may then be further processed by downstream experiment 
# design functions such as match.ga, match.bb, etc.



