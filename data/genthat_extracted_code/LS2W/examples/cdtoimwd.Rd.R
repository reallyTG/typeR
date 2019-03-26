library(LS2W)


### Name: cdtoimwd
### Title: Convert a cddews type object to an imwd type object
### Aliases: cdtoimwd
### Keywords: classes

### ** Examples

#
#Obtain a cddews type object from an image X
#
X<-matrix(rnorm(32*32),nrow=32,ncol=32)
#
CDDEWS <- cddews(X,correct=FALSE,smooth=FALSE)
#
#Verify the class of Matxcddews
#
class(CDDEWS)
#
#Convert to imwd
#
CDDEWSimwd<-cdtoimwd(CDDEWS)
#
#Verify new class
#
class(CDDEWSimwd) 
#



