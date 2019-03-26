library(visNetwork)


### Name: visTree
### Title: Visualize Recursive Partitioning and Regression Trees (rpart
###   object)
### Aliases: visTree

### ** Examples


## Not run: 
##D 
##D library(rpart)
##D 
##D # Basic classification tree
##D res <- rpart(Species~., data=iris)
##D visTree(res, data = iris, main = "Iris classification Tree")
##D 
##D # Basic regression tree
##D res <- rpart(Petal.Length~., data=iris)
##D visTree(res, edgesFontSize = 14, nodesFontSize = 16)
##D 
##D # Complex tree
##D data("solder")
##D res <- rpart(Opening~., data = solder, control = rpart.control(cp = 0.00005))
##D visTree(res, data = solder, nodesPopSize = TRUE, minNodeSize = 10, 
##D   maxNodeSize = 30, height = "800px")
##D 
##D # ----- Options
##D res <- rpart(Opening~., data = solder, control = rpart.control(cp = 0.005))
##D 
##D # fallen leaves + align edges label & size
##D visTree(res, fallenLeaves = TRUE, height = "500px", 
##D  edgesFontAlign = "middle", edgesFontSize = 20)
##D 
##D # disable rules in tooltip, and render tooltip faster
##D # enable hover highlight
##D visTree(res, rules = FALSE, tooltipDelay = 0, 
##D  highlightNearest = list(enabled = TRUE, degree = list(from = 50000, to = 0), 
##D  hover = TRUE, algorithm = "hierarchical"))
##D 
##D # Change color with data.frame
##D colorVar <- data.frame(variable = names(solder), 
##D  color = c("#339933", "#b30000","#4747d1","#88cc00", "#9900ff","#247856"))
##D  
##D colorY <- data.frame(modality = unique(solder$Opening), 
##D  color = c("#AA00AA", "#CDAD15", "#213478"))
##D 
##D visTree(res, colorEdges = "#000099", colorVar = colorVar, colorY = colorY)
##D 
##D # Change color with vector
##D visTree(res, colorEdges = "#000099", 
##D     colorVar = substring(rainbow(6), 1, 7), 
##D     colorY = c("blue", "green", "orange"))
##D     
##D     
##D  # Use visNetwork functions to add more options
##D visTree(res) %>% 
##D     visOptions(highlightNearest = TRUE)
##D 
##D 
## End(Not run)




