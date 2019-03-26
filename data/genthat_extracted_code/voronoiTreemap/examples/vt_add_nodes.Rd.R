library(voronoiTreemap)


### Name: vt_add_nodes
### Title: vt_add_nodes
### Aliases: vt_add_nodes

### ** Examples

n <- vt_create_node("Total")
n <- vt_add_nodes(n, refnode="Total",node_names=c("Asia","Europe"), colors=c("red","blue"))
n <- vt_add_nodes(n, refnode="Asia",node_names=c("China","Thailand"),
  weights=c(0.5, 0.8), codes=c("CN","TH"))
n <- vt_add_nodes(n, refnode="Europe",node_names=c("Netherlands","Austria"),
  weights=c(0.9, 1.1), codes=c("NL","AT"))
print(n, "weight", "code", "color")



