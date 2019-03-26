library(Claddis)


### Name: EdgeMatch
### Title: Edge matching function
### Aliases: EdgeMatch

### ** Examples


# Create a random 10-taxon tree:
original.tree <- rtree(10)

# Remove three leaves:
pruned.tree <- drop.tip(original.tree, c("t1", "t3", "t8"))

# Find matching edges:
X <- EdgeMatch(original.tree, pruned.tree)

# Show matching edges:
X$matching.edges

# Show removed edges:
X$removed.edges




