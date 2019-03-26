library(Claddis)


### Name: CorrectRootTime
### Title: Corrects root.time after taxa have been pruned from a tree
### Aliases: CorrectRootTime

### ** Examples


# Create a simple four-taxon tree with branch lengths:
tree <- read.tree(text = "(A:1,(B:1,(C:1,D:1):1):1);")

# Set root age as 20 Ma:
tree$root.time <- 20

# Now prune taxon A:
pruned.tree <- drop.tip(tree, "A")

# Show that drop.tip has not updated the tree's root time:
pruned.tree$root.time

# Use the function to correct the root time:
pruned.tree <- CorrectRootTime(tree, pruned.tree)

# Show that the root time is now correct (19 Ma):
pruned.tree$root.time




