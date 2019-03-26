library(visNetwork)


### Name: visIgraphLayout
### Title: Use a igraph layout for compute coordinates & fast rendering
### Aliases: visIgraphLayout

### ** Examples


## Not run: 
##D nnodes <- 200
##D nnedges <- 400
##D 
##D nodes <- data.frame(id = 1:nnodes)
##D edges <- data.frame(from = sample(1:nnodes, nnedges, replace = T), 
##D                    to = sample(1:nnodes, nnedges, replace = T))
##D 
##D # with defaut layout
##D visNetwork(nodes, edges) %>% 
##D  visIgraphLayout()
##D 
##D # use full space
##D visNetwork(nodes, edges) %>% 
##D  visIgraphLayout(type = "full")
##D 
##D # in circle ?
##D visNetwork(nodes, edges) %>% 
##D  visIgraphLayout(layout = "layout_in_circle") %>%
##D  visOptions(highlightNearest = list(enabled = T, hover = T), 
##D    nodesIdSelection = T)
##D  
##D # keep physics with smooth curves ?
##D visNetwork(nodes, edges) %>% 
##D  visIgraphLayout(physics = TRUE, smooth = TRUE)
##D 
##D # fix radomSeed to keep position
##D visNetwork(nodes, edges) %>% 
##D  visIgraphLayout(randomSeed = 123)
##D  
##D visNetwork(nodes, edges) %>% 
##D  visIgraphLayout(randomSeed = 123)
##D 
##D # layout_with_sugiyama
##D nodes <- data.frame(id = 1:5)
##D edges <- data.frame(from = c(1, 2, 2, 4), to = c(2, 3, 4, 5))
##D 
##D visNetwork(nodes, edges) %>%
##D  visIgraphLayout(layout = "layout_with_sugiyama", layers = c(1, 2, 3, 3, 4))
##D 
##D visNetwork(nodes, edges) %>%
##D  visIgraphLayout(layout = "layout_with_sugiyama")
##D  
## End(Not run)




