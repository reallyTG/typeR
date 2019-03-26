library(RandomFields)


### Name: RFgridDataFrame-class
### Title: Class 'RFgridDataFrame'
### Aliases: RFgridDataFrame-class RFgridDataFrame
###   RFspDataFrame2conventional,RFgridDataFrame-method
###   RFspDataFrame2dataArray,RFgridDataFrame-method
###   show,RFgridDataFrame-method
###   coerce,RFgridDataFrame,RFpointsDataFrame-method
###   coerce,RFgridDataFrame,RFpointsDataFrame,ANY-method
###   [,RFgridDataFrame-method [,RFgridDataFrame,ANY,ANY-method
###   [,RFgridDataFrame,ANY,ANY,ANY-method [<-,RFgridDataFrame-method
###   [<-,RFgridDataFrame,ANY,ANY,ANY-method
###   dimensions,RFgridDataFrame-method variance,RFgridDataFrame-method
###   print.RFgridDataFrame cbind.RFgridDataFrame range.RFgridDataFrame
###   hist.RFgridDataFrame as.data.frame.RFgridDataFrame
###   as.matrix.RFgridDataFrame as.array.RFgridDataFrame
###   as.vector.RFgridDataFrame as.data.frame.RFgridDataFrame
### Keywords: classes print hplot

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- seq(0,10,length=100)
f <- RFsimulate(model=RMgauss(), x=x, n=3)

str(f)
str(RFspDataFrame2conventional(f))
head(coordinates(f))
str(f[2]) ## selects second column of data-slot
all.equal(f, cbind(f,f)[1:3]) ## TRUE

plot(f, nmax=2)
## Don't show: 
FinalizeExample()
## End(Don't show)


