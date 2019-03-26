library(pmml)


### Name: addLT
### Title: adds a LocalTransformations element to a given PMML file.
### Aliases: addLT
### Keywords: interface

### ** Examples


## Not run: 
##D # make a sample model
##D 
##D library(pmml)
##D model <- pmml(lm(Sepal.Length~., data=iris[,-5]))
##D 
##D # Perform a z-score transform on the first variable of the data set. 
##D # As it is created and used in the same R session, this object is 
##D # already an xml node, not an external text file; so there is no 
##D # need to convert it to an xml node object.
##D 
##D library(pmmlTransformations)
##D irisBox <- WrapData(iris)
##D irisBox <- ZScoreXform(irisBox,"1")
##D xforms <- pmml(,transforms=irisBox)
##D 
##D # Add the LocalTransformations element to the initial PMML model.
##D # Since the model still uses the original fields, the usage 
##D # envisioned for this function is to make it easy if the modeller 
##D # forgot to add the transformations when using the pmml function
##D # initially. 
##D 
##D modified <- addLT(model,xforms,namespace="4_3")
## End(Not run)




