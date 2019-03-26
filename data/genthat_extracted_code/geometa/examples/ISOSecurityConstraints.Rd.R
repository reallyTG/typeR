library(geometa)


### Name: ISOSecurityConstraints
### Title: ISOSecurityConstraints
### Aliases: ISOSecurityConstraints
### Keywords: ISO constraints security

### ** Examples

   #create object
   md <- ISOSecurityConstraints$new()
   md$setClassification("secret")
   md$setUserNote("ultra secret")
   md$setClassificationSystem("no classification in particular")
   md$setHandlingDescription("description")
   
   xml <- md$encode()
   



