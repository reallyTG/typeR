library(rfUtilities)


### Name: rf.crossValidation
### Title: Random Forest Classification or Regression Model
###   Cross-validation
### Aliases: rf.crossValidation

### ** Examples

## Not run: 
##D library(randomForest)
##D 
##D # For classification
##D   data(iris)
##D     iris$Species <- as.factor(iris$Species)    	
##D       set.seed(1234)	
##D ( rf.mdl <- randomForest(iris[,1:4], iris[,"Species"], ntree=501) )
##D   ( rf.cv <- rf.crossValidation(rf.mdl, iris[,1:4], p=0.10, n=99, ntree=501) )
##D 
##D    # Plot cross validation verses model producers accuracy
##D    par(mfrow=c(1,2)) 
##D      plot(rf.cv, type = "cv", main = "CV producers accuracy")
##D      plot(rf.cv, type = "model", main = "Model producers accuracy")
##D 
##D    # Plot cross validation verses model oob
##D    par(mfrow=c(1,2)) 
##D      plot(rf.cv, type = "cv", stat = "oob", main = "CV oob error")
##D      plot(rf.cv, type = "model", stat = "oob", main = "Model oob error")	  
##D 
##D # For regression
##D data(airquality)
##D airquality <- na.omit(airquality) 
##D rf.mdl <- randomForest(y=airquality[,"Ozone"], x=airquality[,2:4])
##D ( rf.cv <- rf.crossValidation(rf.mdl, airquality[,2:4], p=0.10, n=99, ntree=501) )
##D  par(mfrow=c(2,2))
##D    plot(rf.cv)  
##D    plot(rf.cv, stat = "mse")
##D    plot(rf.cv, stat = "var.exp")
##D plot(rf.cv, stat = "mae")
## End(Not run)	 
  



