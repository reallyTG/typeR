library(RandomFields)


### Name: RFpointsDataFrame-class
### Title: Class 'RFpointsDataFrame'
### Aliases: RFpointsDataFrame-class RFpointsDataFrame
###   RFspDataFrame2conventional,RFpointsDataFrame-method
###   show,RFpointsDataFrame-method
###   coerce,RFpointsDataFrame,RFgridDataFrame-method
###   coerce,RFpointsDataFrame,RFgridDataFrame,ANY-method
###   [,RFpointsDataFrame-method [,RFpointsDataFrame,ANY,ANY-method
###   [,RFpointsDataFrame,ANY,ANY,ANY-method [<-,RFpointsDataFrame-method
###   [<-,RFpointsDataFrame,ANY,ANY,ANY-method
###   dimensions,RFpointsDataFrame-method variance,RFpointsDataFrame-method
###   print.RFpointsDataFrame cbind.RFpointsDataFrame
###   range.RFpointsDataFrame hist.RFpointsDataFrame
###   as.matrix.RFpointsDataFrame as.array.RFpointsDataFrame
###   as.vector.RFpointsDataFrame as.data.frame.RFpointsDataFrame
### Keywords: classes print hplot

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- runif(100)
f <- RFsimulate(model=RMexp(), x=x, n=3)

str(f)
str(RFspDataFrame2conventional(f))
head(coordinates(f))
str(f[2]) ## selects second column of data-slot
all.equal(f, cbind(f,f)[1:3]) ## TRUE

plot(f, nmax=2)
## Don't show: 
FinalizeExample()
## End(Don't show)


