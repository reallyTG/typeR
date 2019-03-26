library(rfUtilities)


### Name: logLoss
### Title: Logarithmic loss (logLoss)
### Aliases: logLoss

### ** Examples


  require(randomForest)
    data(iris)
    iris$Species <- ifelse( iris$Species == "versicolor", 1, 0 ) 
    # Add some noise
      idx1 <- which(iris$Species %in% 1)
      idx0 <- which( iris$Species %in% 0)
      iris$Species[sample(idx1, 2)] <- 0
      iris$Species[sample(idx0, 2)] <- 1
    
 ( mdl <- randomForest(x=iris[,1:4], y=as.factor(iris[,"Species"])) )
	
  # Global log loss	
    logLoss(y = iris$Species, p = predict(mdl, iris[,1:4], type="prob")[,2]) 
			   
  # Local log loss
    ( ll <- logLoss(y = iris$Species, p = predict(mdl, iris[,1:4], 
                   type="prob")[,2], global = FALSE) )

  # Log likelihood loss
    logLoss(y = iris$Species, p = predict(mdl, iris[,1:4], 
			    type="prob")[,2], likelihood = TRUE) 
				   



