library(rfUtilities)


### Name: probability.calibration
### Title: Isotonic probability calibration
### Aliases: probability.calibration

### ** Examples

 library(randomForest)
   data(iris)
   iris$Species <- ifelse( iris$Species == "versicolor", 1, 0 ) 
   
   # Add some noise
   idx1 <- which(iris$Species %in% 1)
   idx0 <- which( iris$Species %in% 0)
   iris$Species[sample(idx1, 2)] <- 0
   iris$Species[sample(idx0, 2)] <- 1
 
 # Specify model  
 y = iris[,"Species"] 
 x = iris[,1:4]
 set.seed(4364)  
 ( rf.mdl <- randomForest(x=x, y=factor(y)) )
 y.hat <- predict(rf.mdl, iris[,1:4], type="prob")[,2] 
 
 # Calibrate probabilities
 calibrated.y.hat <- probability.calibration(y, y.hat, regularization = TRUE) 

 # Plot calibrated against original probability estimate
 plot(density(y.hat), col="red", xlim=c(0,1), ylab="Density", xlab="probabilities",
      main="Calibrated probabilities" )
        lines(density(calibrated.y.hat), col="blue")
          legend("topright", legend=c("original","calibrated"), 
 	            lty = c(1,1), col=c("red","blue"))
  



