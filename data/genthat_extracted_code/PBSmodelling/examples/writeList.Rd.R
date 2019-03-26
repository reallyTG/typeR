library(PBSmodelling)


### Name: writeList
### Title: Write a List to a File in PBS Modelling Format
### Aliases: writeList
### Keywords: file list

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   cwd = getwd(); setwd(tempdir())
##D   test <- list(a=10,b=euro,c=view(WorldPhones),d=view(USArrests))
##D   writeList(test,"test.txt",format="P",
##D     comments=" Scalar, Vector, Matrix, Data Frame")
##D   openFile("test.txt")
##D   setwd(cwd)
##D })
##D local(envir=.PBSmodEnv,expr={
##D   cwd = getwd(); setwd(tempdir())
##D   ##Example of dimnames for Arrays
##D   dimnames(Titanic)
##D   writeList( list( Titanic ), format="P")
##D   setwd(cwd)
##D })
## End(Not run)



