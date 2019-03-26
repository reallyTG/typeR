library(party)


### Name: BinaryTree Class
### Title: Class "BinaryTree"
### Aliases: BinaryTree-class weights weights-methods
###   weights,BinaryTree-method show,BinaryTree-method where where-methods
###   where,BinaryTree-method response response-methods
###   response,BinaryTree-method nodes nodes-methods
###   nodes,BinaryTree,integer-method nodes,BinaryTree,numeric-method
###   treeresponse treeresponse-methods treeresponse,BinaryTree-method
### Keywords: classes

### ** Examples


  set.seed(290875)

  airq <- subset(airquality, !is.na(Ozone))
  airct <- ctree(Ozone ~ ., data = airq,   
                 controls = ctree_control(maxsurrogate = 3))

  ### distribution of responses in the terminal nodes
  plot(airq$Ozone ~ as.factor(where(airct)))

  ### get all terminal nodes from the tree
  nodes(airct, unique(where(airct)))

  ### extract weights and compute predictions
  pmean <- sapply(weights(airct), function(w) weighted.mean(airq$Ozone, w))

  ### the same as
  drop(Predict(airct))

  ### or
  unlist(treeresponse(airct))

  ### don't use the mean but the median as prediction in each terminal node
  pmedian <- sapply(weights(airct), function(w) 
                 median(airq$Ozone[rep(1:nrow(airq), w)]))

  plot(airq$Ozone, pmean, col = "red")
  points(airq$Ozone, pmedian, col = "blue")



