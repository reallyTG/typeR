library(RandomFields)


### Name: RFspatialGridDataFrame-class
### Title: Class "RFspatialGridDataFrame"
### Aliases: RFspatialGridDataFrame-class RFspatialGridDataFrame
###   RFspDataFrame2conventional,RFspatialGridDataFrame-method
###   RFspDataFrame2dataArray,RFspatialGridDataFrame-method
###   show,RFspatialGridDataFrame-method
###   coerce,RFspatialGridDataFrame,data.frame-method
###   coerce,SpatialGridDataFrame,RFspatialGridDataFrame-method
###   coerce,RFspatialGridDataFrame,RFspatialPointsDataFrame-method
###   coerce,RFspatialGridDataFrame,RFspatialPointsDataFrame,ANY-method
###   GridTopology2gridVectors,GridTopology-method
###   GridTopology2gridVectors,matrix-method
###   [,RFspatialGridDataFrame-method
###   [,RFspatialGridDataFrame,ANY,ANY-method
###   [,RFspatialGridDataFrame,ANY,ANY,ANY-method
###   [<-,RFspatialGridDataFrame-method
###   [<-,RFspatialGridDataFrame,ANY,ANY,ANY-method
###   dimensions,RFspatialGridDataFrame-method
###   variance,RFspatialGridDataFrame-method print.RFspatialGridDataFrame
###   cbind.RFspatialGridDataFrame range.RFspatialGridDataFrame
###   hist.RFspatialGridDataFrame as.matrix.RFspatialGridDataFrame
###   as.array.RFspatialGridDataFrame as.vector.RFspatialGridDataFrame
###   as.data.frame.RFspatialGridDataFrame
### Keywords: classes print hplot

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

n <- 3

x <- GridTopology(cellcentre.offset=c(0, 0),
 cellsize=c(1, 0.2),
 cells.dim=c(10, 30))
f <- RFsimulate(model=RMexp(), x=x, n=n)

str(f)
str(RFspDataFrame2conventional(f))
str(RFspDataFrame2dataArray(f))
head(coordinates(f))
str(f[2]) ## selects second column of data-slot
all.equal(f, cbind(f,f)[1:3]) ## TRUE
str(as(f, "RFspatialPointsDataFrame"))

plot(f, nmax=2)

steps <- c(10, 1, 10, 10)
## Don't show: 
if(!interactive()){warning("modified <steps>"); steps<-c(2,1,2,2)}
## End(Don't show)
x2 <- rbind(c(0, 0, 0, 0),
 c(1, 0.2, 2, 5),
 steps)
scale <- 10
## Don't show: 
if(!interactive()){warning("modified <scale>");scale<-0.1}
## End(Don't show)
f2 <- RFsimulate(model=RMwhittle(nu=1.2, scale=scale), x=x2, n=n,
                 grid = TRUE)
plot(f2, MARGIN=c(3,4), MARGIN.slices=1, n.slices=6, nmax=2)

f.sp <- RFsimulate(model=RMexp(), x=x, n=n)
f.old <- RFsimulate(model=RMexp(), x=x, n=n, spConform=FALSE)
all.equal(RFspDataFrame2conventional(f.sp)$data, f.old, check.attributes=FALSE) ## TRUE
## Don't show: 
FinalizeExample()
## End(Don't show)


