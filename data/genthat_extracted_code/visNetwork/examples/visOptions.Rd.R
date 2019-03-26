library(visNetwork)


### Name: visOptions
### Title: Network visualization general options
### Aliases: visOptions

### ** Examples

nodes <- data.frame(id = 1:15, label = paste("Label", 1:15),
 group = sample(LETTERS[1:3], 15, replace = TRUE))

edges <- data.frame(from = trunc(runif(15)*(15-1))+1,
 to = trunc(runif(15)*(15-1))+1)
 
###################  
# highlight nearest
###################

visNetwork(nodes, edges) %>% visOptions(highlightNearest = TRUE)
visNetwork(nodes, edges) %>% visOptions(highlightNearest = list(enabled = TRUE, degree = 2))

# also when hover a node ?
visNetwork(nodes, edges) %>% visOptions(highlightNearest = list(enabled = TRUE, hover = TRUE))

# don't show nodes/edges
visNetwork(nodes, edges) %>% visOptions(highlightNearest = list(enabled = TRUE, 
 hover = TRUE, hideColor = 'rgba(200,200,200,0)'))

# Using hierarchical information
nodes = data.frame(id = 1:6, level = c(1, 2, 3, 3, 4, 2))
edges = data.frame(from = c(1, 2, 2, 4, 6), to = c(2, 3, 4, 5, 4))

visNetwork(nodes, edges) %>% visHierarchicalLayout() %>% visEdges(arrows = "to") %>% 
 visOptions(highlightNearest = list(enabled = TRUE, algorithm = "hierarchical"))
 
visNetwork(nodes, edges) %>% visHierarchicalLayout() %>% visEdges(arrows = "to") %>% 
 visOptions(highlightNearest = list(enabled = TRUE, algorithm = "hierarchical", 
   degree = list(from = 0, to = 2)))
   
##########################
# nodesIdSelection
##########################
 
visNetwork(nodes, edges) %>% 
 visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE)

# add a default selected node ?
visNetwork(nodes, edges) %>% 
 visOptions(highlightNearest = TRUE, 
 nodesIdSelection = list(enabled = TRUE, selected = "1"))
 
# subset on id values & don't use labels ?
visNetwork(nodes, edges) %>% 
 visOptions(highlightNearest = TRUE, 
 nodesIdSelection = list(enabled = TRUE, 
   selected = "2", values = c(2:10), useLabels = FALSE))
 
# some style
visNetwork(nodes, edges) %>% 
 visOptions(highlightNearest = TRUE, 
 nodesIdSelection = list(enabled = TRUE, style = 'width: 200px; height: 26px;
   background: #f8f8f8;
   color: darkblue;
   border:none;
   outline:none;'))   
 
##########################
# collapse
##########################
 
nodes <- data.frame(id = 1:15, label = paste("Label", 1:15),
 group = sample(LETTERS[1:3], 15, replace = TRUE))

edges <- data.frame(from = trunc(runif(15)*(15-1))+1,
 to = trunc(runif(15)*(15-1))+1)
 
# keeping all parent node attributes  
visNetwork(nodes, edges) %>% visEdges(arrows = "to") %>%
 visOptions(collapse = TRUE)

# setting some properties  
visNetwork(nodes, edges) %>% visEdges(arrows = "to") %>%
 visOptions(collapse = list(enabled = TRUE, clusterOptions = list(shape = "square"))) 
   
# enable / disable open cluster (proxy only) : 
# visEvents(type = "off", doubleClick = "networkOpenCluster")
# visEvents(type = "on", doubleClick = "networkOpenCluster")  
 
##########################
# selectedBy
##########################
nodes <- data.frame(id = 1:15, label = paste("Label", 1:15),
 group = sample(LETTERS[1:3], 15, replace = TRUE))

edges <- data.frame(from = trunc(runif(15)*(15-1))+1,
 to = trunc(runif(15)*(15-1))+1)
 
visNetwork(nodes, edges) %>% 
 visOptions(selectedBy = "group")
 
# add a default value ?
visNetwork(nodes, edges) %>% 
 visOptions(selectedBy = list(variable = "group", selected = "A"))

# subset on values ?
visNetwork(nodes, edges) %>% 
 visOptions(selectedBy = list(variable = "group", 
   selected = "C",
   values = c("A", "C")))
 
# add some style
visNetwork(nodes, edges) %>% 
 visOptions(selectedBy = list(variable = "group", style = 'width: 200px; height: 26px;
   background: #f8f8f8;
   color: darkblue;
   border:none;
   outline:none;'))
     
# can also be on new column
nodes$sample <- sample(c("sample 1", "sample 2"), nrow(nodes), replace = TRUE)
visNetwork(nodes, edges) %>% 
 visOptions(selectedBy = "sample")

# and with multiple groups ?
nodes$group <- sample(c("group 1", "group 2", "group 1, group 2, group 3"), 
 nrow(nodes), replace = TRUE)
 
visNetwork(nodes, edges) %>% 
 visOptions(selectedBy = list(variable = "group", multiple = TRUE))
  
##########################
# collapse
##########################
visNetwork(nodes, edges) %>% 
 visEdges(arrows = "to") %>% 
 visOptions(collapse = list(enabled = TRUE, 
   clusterOptions = list(shape = "square")))
  



