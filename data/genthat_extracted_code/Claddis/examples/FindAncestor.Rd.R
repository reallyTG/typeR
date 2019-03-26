library(Claddis)


### Name: FindAncestor
### Title: Find ancestor
### Aliases: FindAncestor
### Keywords: ancestor

### ** Examples


# Create a simple four-taxon tree:
tree <- read.tree(text = "(A,(B,(C,D)));")

# Plot the tree:
plot(tree)

# Add nodelabels and show that the most recent common
# ancestor of B, C, and D is node 6:
nodelabels()

# Use FindAncestor to show that the most recent common
# ancestor of B, C, and D is node 6:
FindAncestor(c("B", "C", "D"), tree)




