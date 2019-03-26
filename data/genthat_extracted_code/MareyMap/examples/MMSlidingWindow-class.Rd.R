library(MareyMap)


### Name: MMSlidingWindow-class
### Title: Class "MMSlidingWindow" Interpolation method plug-in for
###   MareyMap
### Aliases: MMSlidingWindow-methods MMSlidingWindow,missing-method
###   MMSlidingWindow MMSlidingWindow-class
###   createOrder,MMSlidingWindow-method
###   interpolate,MMSlidingWindow,MareyMap-method
###   plot,MareyMap,MMSlidingWindow-method plotModel,MMSlidingWindow-method
###   plotRate,MMSlidingWindow-method query,MMSlidingWindow,numeric-method
###   shift<- shift<-,MMSlidingWindow-method shift
###   shift,MMSlidingWindow-method size<- size<-,MMSlidingWindow-method
###   size size,MMSlidingWindow-method threshold<-
###   threshold<-,MMSlidingWindow-method threshold
###   threshold,MMSlidingWindow-method userParam,MMSlidingWindow-method
### Keywords: classes

### ** Examples

data(Homo_sapiens_mean)
human7 <- Homo_sapiens_mean[["Chromosome 07"]]
itr1 <- MMSlidingWindow()
color(itr1) <- "red"
size(itr1) <- 5000000
shift(itr1) <- 1000000
human7 <- human7 + itr1
plot(human7)



