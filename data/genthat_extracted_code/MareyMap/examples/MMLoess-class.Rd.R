library(MareyMap)


### Name: MMLoess-class
### Title: Class "MMLoess". Interpolation method plug-in for MareyMap
### Aliases: MMLoess-methods MMLoess,missing-method MMLoess MMLoess-class
###   createOrder,MMLoess-method degree<- degree<-,MMLoess-method degree
###   degree,MMLoess-method interpolate,MMLoess,MareyMap-method
###   plot,MareyMap,MMLoess-method plotModel,MMLoess-method
###   plotRate,MMLoess-method query,MMLoess,numeric-method span<-
###   span<-,MMLoess-method span span,MMLoess-method
###   userParam,MMLoess-method
### Keywords: classes

### ** Examples

data(Homo_sapiens_male)
chr7 <- Homo_sapiens_male[["Chromosome 07"]]
itr1 <- MMLoess()
color(itr1) <- "red"
span(itr1) <- 0.05
chr7 <- chr7 + itr1



