library(ddalpha)


### Name: Custom Methods
### Title: Using Custom Depth Functions and Classifiers
### Aliases: 'Custom Methods'
### Keywords: depth classif custom

### ** Examples


## Not run: 
##D 
##D #### example:  Euclidean depth ####
##D 
##D #.Euclidean_validate is basically not needed
##D 
##D .Euclidean_learn <- function(ddalpha){
##D   print("Euclidean depth learning")
##D   
##D   #1. Calculate any statistics based on data that .MyDepth_depths needs
##D   #   and store them to the ddalpha object: 
##D   for (i in 1:ddalpha$numPatterns){
##D     ddalpha$patterns[[i]]$center <- colMeans(ddalpha$patterns[[i]]$points)
##D   }
##D   
##D   #2. Calculate depths for each pattern
##D   for (i in 1:ddalpha$numPatterns){
##D     ddalpha$patterns[[i]]$depths = .Euclidian_depths(ddalpha, ddalpha$patterns[[i]]$points)
##D   }
##D   
##D   return(ddalpha)
##D }
##D 
##D .Euclidean_depths <- function(ddalpha, objects){
##D   print("Euclidean depth calculating")
##D   depths <- NULL
##D   
##D   #calculate the depths of the objects w.r.t. each pattern
##D   for (i in 1:ddalpha$numPatterns){
##D     # The depth parameters are accessible in the ddalpha object:
##D     center = ddalpha$patterns[[i]]$center
##D     
##D     depth_wrt_i <- 1/(1 + colSums((t(objects) - center)^2))
##D     depths <- cbind(depths, depth_wrt_i)
##D   }
##D   
##D   return (depths)
##D }
##D 
##D #### example:  binary decision tree ####
##D 
##D library(rpart)
##D 
##D .tree_validate  <- function(ddalpha, ...){
##D   print("tree validating")
##D   return(list(methodSeparatorBinary = T))
##D }
##D 
##D # a binary classifier 
##D # the package takes care of the voting procedures. Just train it as if there are only two classes
##D .tree_learn <- function(ddalpha, index1, index2, depths1, depths2){
##D   print("tree learning")
##D   
##D   # prepare the data
##D   data = as.data.frame(cbind( (rbind(depths1, depths2)), 
##D                               c(rep(1, times = nrow(depths1)), rep(-1, times = nrow(depths1)))))
##D   names(data) <- paste0("V",seq_len(ncol(data)))
##D   names(data)[ncol(data)] <- "O"
##D   # train the classifier
##D   classifier <- rpart(O~., data = data)
##D   
##D   #return the needed values in a list, e.g.
##D   return(classifier)
##D }
##D 
##D # the interface of the classify function is equal for binary and multiclass classifiers
##D .tree_classify <- function(ddalpha, classifier, depths){
##D   print("tree classifying")
##D   
##D   # fill results in a vector, so that the objects from class "classifier$index1" get positive values
##D   data = as.data.frame(depths)
##D   names(data) <- paste0("V",seq_len(ncol(data)))
##D   result <- predict(classifier, as.data.frame(depths), type = "vector")
##D   
##D   return(result)
##D }
##D 
##D 
##D 
##D 
##D #### checking ####
##D 
##D library(ddalpha)
##D data = getdata("hemophilia")
##D 
##D ddalpha = ddalpha.train(data = data, depth = "Euclidean", separator = "tree")
##D c = ddalpha.classify(ddalpha, data[,1:2])
##D errors = sum(unlist(c) != data[,3])/nrow(data)
##D print(paste("Error rate: ",errors))
##D 
##D # building the depth contours using the custom depth
##D depth.contours.ddalpha(ddalpha, asp = T, levels = seq(0.5, 1, length.out = 10))
##D 
## End(Not run)




