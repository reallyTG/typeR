library(pmml)


### Name: addMSAttributes
### Title: adds attribute values to an existing MiningField element in a
###   given PMML file
### Aliases: addMSAttributes
### Keywords: interface

### ** Examples


 # make a sample model
 library(pmml)
 model0 <- lm(Sepal.Length~., data=iris[,-5])
 model <- pmml(model0)

 # Resulting model has mining fields with no information 
 # besides fieldName, dataType and optype. This object is 
 # already an xml node, not an external text file; so there 
 # is no need to convert it to an xml node object.

 # Create data frame with attribute information

 attributes <- data.frame(c("active",1.1,"asIs"),
                          c("active",2.2,"asIs"),
                          c("active",NA,"asMissing"))
 rownames(attributes) <- c("usageType","missingValueReplacement",
                          "invalidValueTreatment")
 colnames(attributes) <- c("Sepal.Width","Petal.Length",
                          "Petal.Width")

 # Although not needed in this first try, necessary to easily 
 # add new values later
 for(k in 1:ncol(attributes)){
    attributes[[k]]<-as.character(attributes[[k]])
  }

 # actual command
 addMSAttributes(model,attributes,namespace="4_3")




