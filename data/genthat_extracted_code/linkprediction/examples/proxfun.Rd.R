library(linkprediction)


### Name: proxfun
### Title: Vertex proximity indexes
### Aliases: proxfun proxfun.igraph proxfun.network

### ** Examples

if(requireNamespace("igraph")) {
  g <- igraph::make_graph(~ A -- C:D:E -- B -- F -- G:H -- I)
  
# Adamic-Adar
proxfun(g, method="aa", value="edgelist")
  
# Random Walk with Restart
proxfun(g, method="rwr", value="edgelist")
}



