library(visNetwork)


### Name: visNetwork-igraph
### Title: Render a visNetwork object from an igraph object
### Aliases: visNetwork-igraph visIgraph toVisNetworkData

### ** Examples


## Not run: 
##D require(igraph)
##D igraph_network <- graph.famous("Walther")
##D 
##D # get data and plot :
##D data <- toVisNetworkData(igraph_network)
##D visNetwork(nodes = data$nodes, edges = data$edges)
##D 
##D # or plot directly
##D visIgraph(igraph_network)
##D 
##D # change layout
##D visIgraph(igraph_network, layout = "layout_in_circle")
##D 
##D # options
##D visIgraph(igraph_network, layout = "layout_in_circle", 
##D  physics = FALSE, smooth = TRUE)
##D  
##D # passing some info  
##D g <- graph.star(8)
##D V(g)$color <- c("green", "grey")
##D V(g)$size <- 1:8 *5
##D V(g)$label <- LETTERS[1:8]
##D V(g)$label.cex = seq(1, 2,length.out = 8)
##D V(g)$label.color = "red"
##D visIgraph(g, layout = "layout.circle", idToLabel = FALSE)  
##D 
##D g <- graph.full(5)
##D E(g)$weight <- runif(ecount(g))
##D E(g)$width <- 1
##D E(g)$color <- "red"
##D E(g)[ weight < 0.5 ]$width <- 4
##D E(g)[ weight < 0.5 ]$color <- "green"
##D E(g)$label <- LETTERS[1:10]
##D E(g)$label.cex = seq(1, 2,length.out = 10)
##D E(g)$label.color = "red"
##D visIgraph(g)
##D 
##D # color vertices of the largest component
##D largest_comp <- function(graph) {
##D  cl <- components(graph)
##D  V(graph)[which.max(cl$csize) == cl$membership]
##D }
##D g <- sample_(gnp(100, 2/100),
##D            with_vertex_(size = 3, label = ""),
##D             with_graph_(layout = layout_with_fr)
##D )
##D giant_v <- largest_comp(g)
##D V(g)$color <- "blue"
##D V(g)[giant_v]$color <- "orange"
##D plot(g)
##D visIgraph(g)
## End(Not run)



