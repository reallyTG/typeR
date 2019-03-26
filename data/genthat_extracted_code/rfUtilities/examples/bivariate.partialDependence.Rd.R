library(rfUtilities)


### Name: bivariate.partialDependence
### Title: Bivariate partial-dependency plot
### Aliases: bivariate.partialDependence

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
 ( rf.mdl1 <- randomForest(x=x, y=factor(y)) )
 
 
 ( bvpd <- bivariate.partialDependence(rf.mdl1, iris, 
                   v1 = "Petal.Length", v2 = "Petal.Width", shade = 0.6,
                   grid.size = 20, ncols=100, border=NA, col.ramp=c("green","blue") ) ) 
	



