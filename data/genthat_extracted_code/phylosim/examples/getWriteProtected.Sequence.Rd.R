library(phylosim)


### Name: getWriteProtected.Sequence
### Title: Check if the object is write protected
### Aliases: getWriteProtected.Sequence Sequence.getWriteProtected
###   getWriteProtected,Sequence-method

### ** Examples


       # create an object
       o<-Sequence()
       # toggle write protection
       o$writeProtected<-TRUE
       # check if it's write protected
       getWriteProtected(o)
       # check write protection via virtual field
       o$writeProtected

 


