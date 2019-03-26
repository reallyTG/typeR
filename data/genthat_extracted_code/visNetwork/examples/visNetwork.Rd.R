library(visNetwork)


### Name: visNetwork
### Title: Network visualization
### Aliases: visNetwork

### ** Examples


# minimal example
nodes <- data.frame(id = 1:3)
edges <- data.frame(from = c(1,2), to = c(1,3))

visNetwork(nodes, edges)

# add a title
visNetwork(nodes, edges, main = "visNetwork minimal example")
visNetwork(nodes, edges, main = list(text = "visNetwork minimal example",
 style = "font-family:Comic Sans MS;color:#ff0000;font-size:15px;text-align:center;"))
 
# and subtitle and footer
visNetwork(nodes, edges, main = "visNetwork minimal example",
 submain = "For add a subtitle", footer = "Fig.1 minimal example")
 
# change background color
visNetwork(nodes, edges, background = "black")

# customization adding more variables (see visNodes and visEdges)
nodes <- data.frame(id = 1:10, 
                    label = paste("Node", 1:10),                                 # labels
                    group = c("GrA", "GrB"),                                     # groups 
                    value = 1:10,                                                # size 
                    shape = c("square", "triangle", "box", "circle", "dot", "star",
                              "ellipse", "database", "text", "diamond"),         # shape
                    title = paste0("<p><b>", 1:10,"</b><br>Node !</p>"),         # tooltip
                    color = c("darkred", "grey", "orange", "darkblue", "purple"),# color
                    shadow = c(FALSE, TRUE, FALSE, TRUE, TRUE))                  # shadow

edges <- data.frame(from = sample(1:10,8), to = sample(1:10, 8),
                    label = paste("Edge", 1:8),                                 # labels
                    length = c(100,500),                                        # length
                    arrows = c("to", "from", "middle", "middle;to"),            # arrows
                    dashes = c(TRUE, FALSE),                                    # dashes
                    title = paste("Edge", 1:8),                                 # tooltip
                    smooth = c(FALSE, TRUE),                                    # smooth
                    shadow = c(FALSE, TRUE, FALSE, TRUE))                       # shadow

visNetwork(nodes, edges) 

# use more complex configuration : 
# when it's a list, you can use data.frame with specific notation like this
nodes <- data.frame(id = 1:3, color.background = c("red", "blue", "green"), 
 color.highlight.background = c("red", NA, "red"), shadow.size = c(5, 10, 15))
edges <- data.frame(from = c(1,2), to = c(1,3),
 label = LETTERS[1:2], font.color =c ("red", "blue"), font.size = c(10,20))

visNetwork(nodes, edges)

# highlight nearest
nodes <- data.frame(id = 1:15, label = paste("Label", 1:15),
 group = sample(LETTERS[1:3], 15, replace = TRUE))

edges <- data.frame(from = trunc(runif(15)*(15-1))+1,
 to = trunc(runif(15)*(15-1))+1)
 
visNetwork(nodes, edges) %>% visOptions(highlightNearest = TRUE)

# try an id node selection 
visNetwork(nodes, edges) %>% 
 visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE)
 
# or add a selection on another column
visNetwork(nodes, edges) %>% 
 visOptions(selectedBy = "group")

nodes$sel <- sample(c("sel1", "sel2"), nrow(nodes), replace = TRUE)
visNetwork(nodes, edges) %>% 
 visOptions(selectedBy = "sel")
   
# add legend
visNetwork(nodes, edges) %>% visLegend()
    
# directed network
visNetwork(nodes, edges) %>% 
 visEdges(arrows = 'from', scaling = list(min = 2, max = 2))

# custom navigation
visNetwork(nodes, edges) %>%
 visInteraction(navigationButtons = TRUE)

# data Manipulation
visNetwork(nodes, edges) %>% visOptions(manipulation = TRUE)

# Hierarchical Layout
visNetwork(nodes, edges) %>% visHierarchicalLayout()

# freeze network
visNetwork(nodes, edges) %>%
 visInteraction(dragNodes = FALSE, dragView = FALSE, zoomView = FALSE)

# use fontAwesome icons using groups or nodes options 
# font-awesome is not part of dependencies. use addFontAwesome() if needed
# http://fortawesome.github.io/Font-Awesome

nodes <- data.frame(id = 1:3, group = c("B", "A", "B"))
edges <- data.frame(from = c(1,2), to = c(2,3))

visNetwork(nodes, edges) %>%
  visGroups(groupname = "A", shape = "icon", icon = list(code = "f0c0", size = 75)) %>%
  visGroups(groupname = "B", shape = "icon", icon = list(code = "f007", color = "red")) %>%
  addFontAwesome()

nodes <- data.frame(id = 1:3)
edges <- data.frame(from = c(1,2), to = c(1,3))

visNetwork(nodes, edges) %>%
  visNodes(shape = "icon", icon = list( face ='FontAwesome', code = "f0c0")) %>%
  addFontAwesome()

# Save a network
## Not run: 
##D network <- visNetwork(nodes, edges) %>% 
##D  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE,
##D  manipulation = TRUE) %>% visLegend()
##D  
##D network %>% visSave(file = "network.html")
##D # same as
##D visSave(network, file = "network.html")
## End(Not run)

# Export as png/jpeg (shiny or browser only)
## Not run: 
##D visNetwork(nodes, edges) %>% 
##D  visExport()
## End(Not run)

# DOT language
visNetwork(dot = 'dinetwork {1 -> 1 -> 2; 2 -> 3; 2 -- 4; 2 -> 1 }')

# gephi json file
## Not run: 
##D visNetwork(gephi = 'WorldCup2014.json') %>% visPhysics(stabilization = FALSE,   barnesHut = list(
##D     gravitationalConstant = -10000,
##D     springConstant = 0.002,
##D     springLength = 150
##D   ))
## End(Not run)




