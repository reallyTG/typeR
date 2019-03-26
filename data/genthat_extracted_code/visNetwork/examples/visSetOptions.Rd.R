library(visNetwork)


### Name: visSetOptions
### Title: Network visualization full options setter
### Aliases: visSetOptions

### ** Examples

nodes <- data.frame(id = 1:3)
edges <- data.frame(from = c(1,2), to = c(1,3))

# using visNetwork functions
visNetwork(nodes, edges) %>% visNodes(shape = "square", color = "red") %>%
   visEdges(arrows = "to")

# directly use visSetOptions
visNetwork(nodes, edges) %>% 
 visSetOptions(options = list(nodes = list(shape = "square", color = "red"),
                              edges = list(arrows = "to")))






