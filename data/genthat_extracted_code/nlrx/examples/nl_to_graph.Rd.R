library(nlrx)


### Name: nl_to_graph
### Title: Generate igraph objects from measured turtles and links metrics
### Aliases: nl_to_graph

### ** Examples

## Not run: 
##D ## Example running the Giant Component model from the NetLogo models library:
##D library(nlrx)
##D library(igraph)
##D # Windows default NetLogo installation path (adjust to your needs!):
##D netlogopath <- file.path("C:/Program Files/NetLogo 6.0.4")
##D modelpath <- file.path(netlogopath, "app/models/Sample Models/Networks/Giant Component.nlogo")
##D outpath <- file.path("C:/out")
##D # Unix default NetLogo installation path (adjust to your needs!):
##D netlogopath <- file.path("/home/NetLogo 6.0.4")
##D modelpath <- file.path(netlogopath, "app/models/Sample Models/Networks/Giant Component.nlogo")
##D outpath <- file.path("/home/out")
##D 
##D nl <- nl(nlversion = "6.0.4",
##D          nlpath = netlogopath,
##D          modelpath = modelpath,
##D          jvmmem = 1024)
##D 
##D nl@experiment <- experiment(expname="networks",
##D                             outpath=outpath,
##D                             repetition=1,
##D                             tickmetrics="false",
##D                             idsetup="setup",
##D                             idgo="go",
##D                             runtime=50,
##D                             metrics.turtles = list("turtles" = c("who", "color")),
##D                             metrics.links = list("links" = c("[who] of end1", "[who] of end2")),
##D                             constants = list("num-nodes" = 80,
##D                                              "layout?" = "true"))
##D 
##D nl@simdesign <- simdesign_simple(nl, 1)
##D nl@simdesign@simoutput <- run_nl_all(nl)
##D nl.graph <- nl_to_graph(nl)
##D 
##D ## Extract graph of tick 1:
##D nl.graph.i <- nl.graph$spatial.links[[1]]
##D ## Set vertex colors by measured color variable:
##D vcols <- c("7" = "grey", "15" = "red")
##D V(nl.graph.i)$color <- vcols[as.character(V(nl.graph.i)$color)]
##D ## Set edge colors by measured link breed:
##D ecols <- c("links" = "black")
##D E(nl.graph.i)$color <- ecols[E(nl.graph.i)$breed]
##D 
##D ## Plot:
##D plot.igraph(nl.graph.i, vertex.size=8, vertex.label=NA, edge.arrow.size=0.2)
##D 
## End(Not run)



