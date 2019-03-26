library(phylosim)


### Name: getWriteProtected.Process
### Title: Check if the object is write protected
### Aliases: getWriteProtected.Process Process.getWriteProtected
###   getWriteProtected,Process-method

### ** Examples


       # create an object
       o<-Process()
       # toggle write protection
       o$writeProtected<-TRUE
       # check if it's write protected
       getWriteProtected(o)
       # check write protection via virtual field
       o$writeProtected

 


