library(collapsibleTree)


### Name: collapsibleTree
### Title: Create Interactive Collapsible Tree Diagrams
### Aliases: collapsibleTree collapsibleTree.data.frame
###   collapsibleTree.Node

### ** Examples

collapsibleTree(warpbreaks, c("wool", "tension", "breaks"))

# Data from US Forest Service DataMart
species <- read.csv(system.file("extdata/species.csv", package = "collapsibleTree"))
collapsibleTree(df = species, c("REGION", "CLASS", "NAME"), fill = "green")

# Visualizing the order in which the node colors are filled
library(RColorBrewer)
collapsibleTree(
  warpbreaks, c("wool", "tension"),
  fill = brewer.pal(9, "RdBu"),
  fillByLevel = TRUE
)
collapsibleTree(
  warpbreaks, c("wool", "tension"),
  fill = brewer.pal(9, "RdBu"),
  fillByLevel = FALSE
)

# Tooltip can be mapped to an attribute, or default to leafCount
collapsibleTree(
  warpbreaks, c("wool", "tension", "breaks"),
  tooltip = TRUE,
  attribute = "breaks"
)

# Node size can be mapped to any numeric column, or to leafCount
collapsibleTree(
  warpbreaks, c("wool", "tension", "breaks"),
  nodeSize = "breaks"
)

# collapsibleTree.Node example
data(acme, package="data.tree")
acme$Do(function(node) node$cost <- data.tree::Aggregate(node, attribute = "cost", aggFun = sum))
collapsibleTree(acme, nodeSize  = "cost", attribute = "cost", tooltip = TRUE)

# Emulating collapsibleTree.data.frame using collapsibleTree.Node
species <- read.csv(system.file("extdata/species.csv", package = "collapsibleTree"))
hierarchy <- c("REGION", "CLASS", "NAME")
species$pathString <- paste(
  "species",
  apply(species[,hierarchy], 1, paste, collapse = "//"),
  sep = "//"
)
df <- data.tree::as.Node(species, pathDelimiter = "//")
collapsibleTree(df)




