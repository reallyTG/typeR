library(rfUtilities)


### Name: rf.significance
### Title: Random Forest model significance test
### Aliases: rf.significance

### ** Examples

## Not run: 
##D # Regression
##D require(randomForest)
##D   set.seed(1234)	
##D     data(airquality)
##D     airquality <- na.omit(airquality)
##D  ( rf.mdl <- randomForest(x=airquality[,2:6], y=airquality[,1]) )
##D    ( rf.perm <- rf.significance(rf.mdl, airquality[,2:6], nperm=99, ntree=501) )
##D  
##D # Classification
##D require(randomForest)
##D   set.seed(1234)	
##D     data(iris)
##D       iris$Species <- as.factor(iris$Species) 
##D  ( rf.mdl <- randomForest(iris[,1:4], iris[,"Species"], ntree=501) )
##D    ( rf.perm <- rf.significance(rf.mdl, iris[,1:4], nperm=99, ntree=501) ) 
## End(Not run)




