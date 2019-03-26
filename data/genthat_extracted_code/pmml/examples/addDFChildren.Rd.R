library(pmml)


### Name: addDFChildren
### Title: adds 'Interval' and 'Value' child elements to a given DataField
###   element in a given PMML file
### Aliases: addDFChildren
### Keywords: interface

### ** Examples


 # make a sample model
 library(pmml)
 model0 <- lm(Sepal.Length~., data=iris[,-5])
 model <- pmml(model0)

 # Resulting model has data fields but with no 'Interval' or Value' 
 # elements. This object is already an xml node, not an external text
 # file; so there is no need to convert it to an xml node object.

 # add an 'Interval' element node by typing it in 
 addDFChildren(model, field="Sepal.Length", 
              intervals=list(newXMLNode("Interval",
              attrs=c(closure="openClosed",rightMargin=3))))

 # use helper functions to create list of 'Interval' and 'Value' 
 # elements. We define the 3 Intervals as ,1]  (1,2)  and [2,  
 mi<-makeIntervals(list("openClosed","openOpen","closedOpen"),
                  list(NULL,1,2),list(1,2,NULL))
 
 # define 3 values, none with a 'displayValue' attribute and 1 value 
 # defined as 'invalid'. The 2nd one is 'valid' by default.
 mv<-makeValues(list(1.1,2.2,3.3),list(NULL,NULL,NULL),
                list("valid",NULL,"invalid"))
 
 # As an example, apply these to the Sepal.Length field.
 addDFChildren(model, field="Sepal.Length", intervals=mi, values=mv)
 # Only defined 'Interval's 
 addDFChildren(model, field="Sepal.Length", intervals=mi)




