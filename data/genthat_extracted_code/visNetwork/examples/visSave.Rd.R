library(visNetwork)


### Name: visSave
### Title: Save a a visNetwork object to an HTML file
### Aliases: visSave

### ** Examples


## Not run: 
##D 
##D nodes <- data.frame(id = 1:3, group = c("B", "A", "B"))
##D edges <- data.frame(from = c(1,2), to = c(2,3))
##D 
##D network <- visNetwork(nodes, edges)
##D network
##D 
##D network %>% visSave(file = "network.html", background = "black")
##D 
##D # same as
##D visSave(network, file = "network.html", background = "black")
##D 
## End(Not run)



