library(Claddis)


### Name: GetDescendantEdges
### Title: Gets descendant edges of an internal node
### Aliases: GetDescendantEdges

### ** Examples


# Create simple four-taxon tree:
tree <- read.tree(text = "(A,(B,(C,D)));")

# Plot tree:
plot(tree)

# Add nodelabels:
nodelabels()

# Add edgelabels (note that edges 5 and 6
# are descendants of node 7):
edgelabels()

# Use GdtDescendantEdges to show that edges
# 5 and 6 are descendants of node 7:
GetDescendantEdges(7, tree)




