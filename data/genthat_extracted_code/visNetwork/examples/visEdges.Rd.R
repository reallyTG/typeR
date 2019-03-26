library(visNetwork)


### Name: visEdges
### Title: Network visualization edges options
### Aliases: visEdges

### ** Examples


nodes <- data.frame(id = 1:3)
edges <- data.frame(from = c(1,2), to = c(1,3))

# arrows
visNetwork(nodes, edges) %>% visEdges(arrows = 'from')
visNetwork(nodes, edges) %>% visEdges(arrows = 'to, from')

visNetwork(nodes, edges) %>% 
  visEdges(arrows = list(to = list(enabled = TRUE, 
     scaleFactor = 2, type = 'circle')))

# smooth
visNetwork(nodes, edges) %>% visEdges(smooth = FALSE)
visNetwork(nodes, edges) %>% visEdges(smooth = list(enabled = TRUE, type = "diagonalCross"))

# width
visNetwork(nodes, edges) %>% visEdges(width = 10)

# color
visNetwork(nodes, edges) %>% visEdges(color = list(hover = "green")) %>%
 visInteraction(hover = TRUE)
visNetwork(nodes, edges) %>% visEdges(color = "red")
visNetwork(nodes, edges) %>% visEdges(color = list(color = "red", highlight = "yellow"))

# shadow
visNetwork(nodes, edges) %>% visEdges(shadow = TRUE)
visNetwork(nodes, edges) %>% visEdges(shadow = list(enabled = TRUE, size = 5))

# dashes
# globally
visNetwork(nodes, edges) %>% visEdges(dashes = TRUE)

# set configuration individualy 
# have to use specific notation...
nodes <- data.frame(id = 1:3)
edges <- data.frame(from = c(1,2), to = c(1,3),
     dashes = c("[10,10,2,2]", "false"))

visNetwork(nodes, edges)

edges <- data.frame(from = c(1,2), to = c(1,3),
     dashes = c("[10,10,2,2]", "[2]"))

visNetwork(nodes, edges)




