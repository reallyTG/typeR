library(partykit)


### Name: nodeids
### Title: Extract Node Identifiers
### Aliases: nodeids nodeids.party nodeids.partynode get_paths
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

  ## set up party object
  data("iris")
  tree <- party(node, data = iris, 
      fitted = data.frame("(fitted)" = 
                          fitted_node(node, data = iris),
                          check.names = FALSE))
  tree
  
  ### ids of all nodes
  nodeids(tree)

  ### ids of all terminal nodes
  nodeids(tree, terminal = TRUE)

  ### ids of terminal nodes in subtree with root [3]
  nodeids(tree, from = 3, terminal = TRUE)

  ### get paths and extract all terminal nodes
  tr <- unclass(node_party(tree))
  lapply(get_paths(tree, nodeids(tree, terminal = TRUE)), 
         function(path) tr[path])




