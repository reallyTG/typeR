library(pmml)


### Name: addDDAttributes
### Title: adds attribute values to an existing DataField element in a
###   given PMML file
### Aliases: addDDAttributes
### Keywords: interface

### ** Examples


 # make a sample model
 library(pmml)
 model0 <- lm(Sepal.Length~., data=iris[,-5])
 model <- pmml(model0)

 # Resulting model has mining fields with no information besides
 # fieldName, dataType and optype. this object is already an xml
 # node, not an external text file; so there is no need to convert
 # it to an xml node object.

 # create data frame with attribute information

 attributes <- data.frame(c("FlowerWidth",1),c("FlowerLength",0),
                          stringAsFactors=FALSE)
 rownames(attributes) <- c("displayName","isCyclic")
 colnames(attributes) <- c("Sepal.Width","Petal.Length")
 # although not needed in this first try, necessary to easily add
 # new values later. Removes values as factors so that new values
 # added later are not evaluated as factor values and thus rejected
 # as invalid.
 attributes[] <- lapply(attributes,as.character)

 # actual command
 addDDAttributes(model,attributes,namespace="4_3")

 # Alternative method to add attributes to a single field, 
 # "Sepal.Width"
 addDDAttributes(model,c(displayName="FlowerWidth",isCyclic=1),
                "Sepal.Width")


mi<-makeIntervals(list("openClosed","closedClosed","closedOpen"),
                  list(NULL,1,2),list(1,2,NULL))
mv<-makeValues(list("A","B","C"),list(NULL,NULL,NULL),
                  list("valid",NULL,"invalid"))
addDFChildren(model, field="Sepal.Length", interval=mi, values=mv)




