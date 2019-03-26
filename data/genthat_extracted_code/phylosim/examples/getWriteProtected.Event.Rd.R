library(phylosim)


### Name: getWriteProtected.Event
### Title: Check if the object is write protected
### Aliases: getWriteProtected.Event Event.getWriteProtected
###   getWriteProtected,Event-method

### ** Examples


       # create an object
       o<-Event()
       # toggle write protection
       o$writeProtected<-TRUE
       # check if it's write protected
       getWriteProtected(o)
       # check write protection via virtual field
       o$writeProtected

 


