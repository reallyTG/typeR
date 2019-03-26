library(RandomFields)


### Name: RFspatialPointsDataFrame-class
### Title: Class "RFspatialPointsDataFrame"
### Aliases: RFspatialPointsDataFrame-class RFspatialPointsDataFrame
###   RFspDataFrame2conventional,RFspatialPointsDataFrame-method
###   show,RFspatialPointsDataFrame-method
###   coerce,RFspatialPointsDataFrame,RFspatialGridDataFrame-method
###   coerce,RFspatialPointsDataFrame,RFspatialGridDataFrame,ANY-method
###   coerce,RFspatialPointsDataFrame,data.frame-method
###   coerce,SpatialPointsDataFrame,RFspatialPointsDataFrame-method
###   coerce,SpatialPointsDataFrame,RFspatialPointsDataFrame-method
###   [,RFspatialPointsDataFrame-method
###   [,RFspatialPointsDataFrame,ANY,ANY-method
###   [,RFspatialPointsDataFrame,ANY,ANY,ANY-method
###   [<-,RFspatialPointsDataFrame-method
###   [<-,RFspatialPointsDataFrame,ANY,ANY,ANY-method
###   dimensions,RFspatialPointsDataFrame-method
###   variance,RFspatialPointsDataFrame-method
###   print.RFspatialPointsDataFrame cbind.RFspatialPointsDataFrame
###   range.RFspatialPointsDataFrame hist.RFspatialPointsDataFrame
###   as.matrix.RFspatialPointsDataFrame as.array.RFspatialPointsDataFrame
###   as.vector.RFspatialPointsDataFrame
###   as.data.frame.RFspatialPointsDataFrame
### Keywords: classes print hplot

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- cbind(runif(50), runif(50))
f <- RFsimulate(model=RMexp(), x=x, n=3)

str(f)
str(RFspDataFrame2conventional(f))
head(coordinates(f))
str(f[2]) ## selects second column of data-slot
all.equal(f, cbind(f,f)[1:3]) ## TRUE
try(as(f, "RFspatialGridDataFrame")) # yields error

plot(f, nmax=2)

f2 <- RFsimulate(model=RMwhittle(nu=1.2, scale=10), x=cbind(x,x), n=4)
plot(f2, MARGIN=c(3,4), nmax=2)

f.sp <- RFsimulate(model=RMexp(), x=x, n=3)
f.old <- RFsimulate(model=RMexp(), x=x, n=3, spConform=FALSE)
all.equal(RFspDataFrame2conventional(f.sp)$data, f.old, check.attributes=FALSE) ## TRUE

## Don't show: 
FinalizeExample()
## End(Don't show)


