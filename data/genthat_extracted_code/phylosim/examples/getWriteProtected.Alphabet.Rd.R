library(phylosim)


### Name: getWriteProtected.Alphabet
### Title: Check if the object is write protected
### Aliases: getWriteProtected.Alphabet Alphabet.getWriteProtected
###   getWriteProtected,Alphabet-method

### ** Examples


       # create an object
       o<-Alphabet()
       # toggle write protection
       o$writeProtected<-TRUE
       # check if it's write protected
       getWriteProtected(o)
       # check write protection via virtual field
       o$writeProtected

 


