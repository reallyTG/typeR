library(Claddis)


### Name: GetNodeAges
### Title: Returns node ages for a time-scaled tree
### Aliases: GetNodeAges

### ** Examples


# Create simple four-taxon tree with edge lengths all
# set to 1 Ma:
tree <- read.tree(text="(A:1,(B:1,(C:1,D:1):1):1);")

# Set root.time as 10 Ma:
tree$root.time <- 10

# Get node ages:
GetNodeAges(tree)




