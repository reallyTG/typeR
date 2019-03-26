library(visNetwork)


### Name: visHclust
### Title: Visualize Hierarchical cluster analysis.
### Aliases: visHclust visHclust.default visHclust.data.frame
###   visHclust.dist visHclust.hclust

### ** Examples


## Not run: 
##D 
##D #--------------
##D # data.frame
##D #--------------
##D 
##D # default call on data.frame
##D visHclust(iris, cutree = 3, colorEdges = "red")
##D 
##D # update some parameters
##D visHclust(iris, cutree = 3, tooltipColumns = c(1, 5),
##D   colorGroups = c("red", "blue", "green"), horizontal = TRUE)
##D   
##D # no graphics on tooltip
##D visHclust(iris, cutree = 3, tooltipColumns = NULL,
##D   main = "Hclust on iris")
##D   
##D # Title(s)
##D visHclust(iris, cutree = 3,  main ="My_title",
##D           submain = "My_sub_title", footer = "My_footer")
##D           
##D # Export
##D visHclust(iris, cutree = 3, export = TRUE)
##D 
##D 
##D # update group / individual nodes
##D visHclust(iris, cutree = 8) %>% 
##D  visGroups(groupname = "group", color ="black", 
##D    shape = "triangleDown", size = 75)  %>% 
##D  visGroups(groupname = "individual", 
##D    font = list(size = 150),
##D    color = list(background = "white", border = "purple", 
##D             highlight = "#e2e9e9", hover = "orange"), shape = "box") 
##D 
##D #--------------
##D # dist
##D #--------------
##D 
##D # without adding data & info in tooltip
##D visHclust(dist(iris[,1:4]), cutree = 3)
##D   
##D # adding data & info in tooltip
##D visHclust(dist(iris[,1:4]), cutree = 3, data = iris)
##D 
##D #--------------
##D # hclust
##D #--------------
##D 
##D # without adding data & info in tooltip
##D visHclust(hclust(dist(iris[,1:4])), cutree = 3)
##D   
##D # adding data & info in tooltip
##D visHclust(hclust(dist(iris[,1:4])), cutree = 3, data = iris) 
##D     
## End(Not run)




