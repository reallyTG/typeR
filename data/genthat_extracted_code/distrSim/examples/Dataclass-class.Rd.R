library(distrSim)


### Name: Dataclass-class
### Title: Class "Dataclass"
### Aliases: Dataclass-class initialize,Dataclass-method
### Keywords: manip

### ** Examples

D66 <- Dataclass(filename="N74", Data = matrix(1:36,6))
D66
#
D <- Dataclass(Data = array(c(1,2,3,4,5,6),c(samplesize=2,obsdim=3,Runs=1)),
               filename = "xyz.sav")
# A new object of type "Dataclass" is created.
#
isOldVersion(D) ##NO!
#
savedata(D)
# creates a file called "xyz.sav" where the information is saved and a
# copy "xyz.sav.comment" without data
Data(D) <- array(c(11,12,13,14,15,16),c(samplesize=2,obsdim=3,Runs=1)) # changes the data of D
cload("xyz.sav") # loads the object without data - it is called "D.comment"
D.comment
load("xyz.sav") # loads the original object "D"
Data(D) # the original data: matrix(c(1,2,3,4,5,6),2)
#if you have distrTEst available:
#evaluate(object = D, estimator = mean) # returns the mean of each variable



