library(pmml)


### Name: fileToXMLNode
### Title: Reads in a file and tries to parse it into an object of type
###   XMLNode
### Aliases: fileToXMLNode
### Keywords: interface

### ** Examples


## Not run: 
##D # define some transformations
##D  library(pmml)
##D  library(pmmlTransformations)
##D 
##D  irisBox <- WrapData(iris)
##D  irisBox <- ZScoreXform(irisBox,xformInfo = "column1->d1")
##D  irisBox <- ZScoreXform(irisBox,xformInfo = "column2->d2")
##D 
##D #make a LocalTransformations element and save it to an external file
##D  pmml_trans <- pmml(NULL, transforms=irisBox)
##D  write(toString(pmml_trans),file = "xform_iris.pmml")
##D 
##D  # Later, we may need to read in the PMML model into R
##D  # 'lt' below is now a XML Node, as opposed to a string
##D 
##D  lt <- fileToXMLNode("xform_iris.pmml")
## End(Not run)



