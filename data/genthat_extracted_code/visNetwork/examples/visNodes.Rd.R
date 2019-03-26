library(visNetwork)


### Name: visNodes
### Title: Network visualization nodes options
### Aliases: visNodes

### ** Examples


nodes <- data.frame(id = 1:3)
edges <- data.frame(from = c(1,2), to = c(1,3))

visNetwork(nodes, edges) %>% 
  visNodes(shape = "square", title = "I'm a node", borderWidth = 3)

visNetwork(nodes, edges) %>% 
  visNodes(color = list(hover = "green")) %>%
  visInteraction(hover = TRUE)

visNetwork(nodes, edges) %>% visNodes(color = "red")

visNetwork(nodes, edges) %>% 
  visNodes(color = list(background = "red", border = "blue", 
    highlight = "yellow"))

visNetwork(nodes, edges) %>% visNodes(shadow = TRUE)

visNetwork(nodes, edges) %>% visNodes(shadow = list(enabled = TRUE, size = 50))





