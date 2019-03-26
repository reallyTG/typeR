library(TRADER)


### Name: boundaryLineALL
### Title: Overal function for Black and Abrams 2003 method or "pure
###   boundary line".
### Aliases: boundaryLineALL
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(relData)
boundaryLineALL(relData1)
boundaryLineALL(relData1,length=3,buffer=4,storedev=pdf,
  boundary=function(x) {5.0067*exp(-0.664*x)} )



