library(LS2W)


### Name: convertimwd
### Title: Convert a non-decimated imwd object to a wst2D object.
### Aliases: convertimwd
### Keywords: classes

### ** Examples

#
#Obtain an imwd class object
#
testimage <- HaarMontage(256, "diagonal")
#
IMWDobject<- imwd(testimage, type="station")

# Verify the class of this object
#
class(IMWDobject) 
#
#Convert to packet ordered
#
IMWDconverted<-convertimwd(IMWDobject)
#
#Verify new class
#
class(IMWDconverted)
#



