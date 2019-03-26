library(RandomFields)


### Name: RFsp-class
### Title: Class 'RFsp'
### Aliases: RFsp-class RFspatialDataFrame RFdataFrame summary,RFsp-method
###   variance,RFsp-method dimensions,RFsp-method
###   dimensions,RFdataFrame-method dimensions,RFspatialDataFrame-method
###   RFspDataFrame2conventional RFspDataFrame2conventional,RFsp-method
###   RFspDataFrame2dataArray RFspDataFrame2dataArray,RFsp-method
###   [,RFsp-method [,RFsp,ANY,ANY-method [,RFsp,ANY,ANY,ANY-method
###   [<-,RFsp-method [<-,RFsp,ANY,ANY-method [<-,RFsp,ANY,ANY,ANY-method
###   RFspatialDataFrame-class RFspatialDataFrame RFdataFrame-class
###   RFdataFrame
### Keywords: classes

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Generating an object of class "RFspatialGridDataFrame"
## and one of class "RFspatialPointsDataFrame".

model <- RMcauchy(gamma=4, var=0.1, scale=2)
x <- seq(0,10,len=100)
r <- cbind(runif(100, min=1, max=9),runif(100, min=1, max=9))

z1 <- RFsimulate(model=model, x=x, y=x, n=4)
z2 <- RFsimulate(model=model, x=r, n=2)

## Applying available functions.

class(z1)
class(z2)
summary(z1)
summary(z2)
plot(z1)
plot(z2)

z4 <- RFspDataFrame2conventional(z2)
str(z2)
str(z4)

dta <- data.frame(coords=z4$x,data=z2@data[,1])
z3<-RFinterpolate(model=model, x=x, y=x, data=dta) 
plot(z3,z2)

## Illustrating the warning.

a1 <- new("RFpointsDataFrame")
str(a1)
try(a2 <- new("RFsp")) ## ERROR
## Don't show: 
FinalizeExample()
## End(Don't show)


