library(partykit)


### Name: partynode-methods
### Title: Methods for Node Objects
### Aliases: partynode-methods is.partynode as.partynode
###   as.partynode.partynode as.partynode.list as.list.partynode
###   length.partynode [.partynode [[.partynode is.terminal
###   is.terminal.partynode depth.partynode width width.partynode
###   print.partynode nodeprune.partynode
### Keywords: tree

### ** Examples

## a tree as flat list structure
nodelist <- list(
  # root node
  list(id = 1L, split = partysplit(varid = 4L, breaks = 1.9), 
      kids = 2:3),
  # V4 <= 1.9, terminal node
  list(id = 2L),
  # V4 > 1.9
  list(id = 3L, split = partysplit(varid = 1L, breaks = 1.7), 
      kids = c(4L, 7L)),
  # V1 <= 1.7
  list(id = 4L, split = partysplit(varid = 4L, breaks = 4.8), 
      kids = 5:6),
  # V4 <= 4.8, terminal node
  list(id = 5L),
  # V4 > 4.8, terminal node
  list(id = 6L),
  # V1 > 1.7, terminal node
  list(id = 7L)
)

## convert to a recursive structure
node <- as.partynode(nodelist)

## print raw recursive structure without data
print(node)

## print tree along with the associated iris data
data("iris", package = "datasets")
print(node, data = iris)

## print subtree
print(node[2], data = iris)

## print subtree, with root node number one
print(as.partynode(node[2], from = 1), data = iris)

## number of kids in root node
length(node)

## depth of tree
depth(node)

## number of terminal nodes
width(node)

## convert back to flat structure
as.list(node)



