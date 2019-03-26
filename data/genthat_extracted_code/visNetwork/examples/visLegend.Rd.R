library(visNetwork)


### Name: visLegend
### Title: Add a legend on a visNetwork object
### Aliases: visLegend

### ** Examples


# minimal example
nodes <- data.frame(id = 1:3, group = c("B", "A", "B"))
edges <- data.frame(from = c(1,2), to = c(2,3))

# default, on group
visNetwork(nodes, edges) %>%
  visGroups(groupname = "A", color = "red") %>%
  visGroups(groupname = "B", color = "lightblue") %>%
  visLegend()
  
# on group, adding options
visNetwork(nodes, edges) %>%
  visGroups(groupname = "A", color = "red") %>%
  visGroups(groupname = "B", color = "lightblue") %>%
  visLegend(width = 0.05, position = "right", main = "Legend")
  
# css on main   
visNetwork(nodes, edges) %>%
  visGroups(groupname = "A", color = "red") %>%
  visGroups(groupname = "B", color = "lightblue") %>%
  visLegend(main = list(text = "Custom Legend",
 style = "font-family:Comic Sans MS;color:#ff0000;font-size:12px;text-align:center;"))
   
# passing custom nodes and/or edges
lnodes <- data.frame(label = c("Group A", "Group B"), 
 shape = c( "ellipse"), color = c("red", "lightblue"),
 title = "Informations") 
   
ledges <- data.frame(color = c("lightblue", "red"), 
 label = c("reverse", "depends"), arrows =c("to", "from"), 
 font.align = "top") 
 
visNetwork(nodes, edges) %>%
  visGroups(groupname = "A", color = "red") %>%
  visGroups(groupname = "B", color = "lightblue") %>%
  visLegend(addNodes = lnodes, addEdges = ledges, useGroups = FALSE)
   
# divide in columns
visNetwork(nodes, edges) %>%
  visGroups(groupname = "A", color = "red") %>%
  visGroups(groupname = "B", color = "lightblue") %>%
  visLegend(addNodes = lnodes, useGroups = TRUE, ncol = 2)
  
# for more complex option, you can use a list(of list...)
# or a data.frame with specific notaion

nodes <- data.frame(id = 1:3, group = c("B", "A", "B"))
edges <- data.frame(from = c(1,2), to = c(2,3))

# using a list
visNetwork(nodes, edges) %>%
 visGroups(groupname = "A", shape = "icon", icon = list(code = "f0c0", size = 75)) %>%
 visGroups(groupname = "B", shape = "icon", icon = list(code = "f007", color = "red")) %>%
 addFontAwesome() %>%
 visLegend(addNodes = list(
  list(label = "Group", shape = "icon", icon = list(code = "f0c0", size = 25)),
  list(label = "User", shape = "icon", icon = list(code = "f007", size = 50, color = "red"))
 ),
 addEdges = data.frame(label = "link"), useGroups = FALSE)   
 
# using a data.frame
addNodes <- data.frame(label = c("Group", "User"), shape = "icon",
 icon.code = c("f0c0", "f007"), icon.size = c(25, 50), icon.color = c(NA, "red"))
 
visNetwork(nodes, edges) %>%
 visGroups(groupname = "A", shape = "icon", icon = list(code = "f0c0", size = 75)) %>%
 visGroups(groupname = "B", shape = "icon", icon = list(code = "f007", color = "red")) %>%
 addFontAwesome() %>%
 visLegend(addNodes = addNodes,
   addEdges = data.frame(label = "link"), useGroups = FALSE)   
   



