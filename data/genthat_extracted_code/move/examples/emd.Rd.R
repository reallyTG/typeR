library(move)


### Name: emd
### Title: Earth movers distance
### Aliases: emd emd,RasterLayer,RasterLayer-method
###   emd,RasterStackBrick,missing-method
###   emd,RasterStackBrick,RasterStackBrick-method
###   emd,SpatialPoints,SpatialPoints-method

### ** Examples

## with a DBBMMStack object
  data(dbbmmstack)
  ## to optimize the calculation, the cells outside of the 99.99% UD contour 
  # are removed by setting them to zero.
  values(dbbmmstack)[values(getVolumeUD(dbbmmstack))>.999999]<-0
  stk<-(dbbmmstack/cellStats(dbbmmstack,sum))
  emd(stk[[1]],stk[[2]])
  emd(stk)
  emd(stk, threshold=10000)
  
## with a SpatiaPointsDataFrame 
  x<-SpatialPointsDataFrame(cbind(c(1:3,5),2), data=data.frame(rep(.25,4)))
  y<-SpatialPointsDataFrame(coordinates(x), data.frame(c(0,.5,.5,0)))
  emd(x,y)
  emd(x,y,threshold=.1)

## with a DBBMMBurstStack object, to compare the utilization 
# distributions of e.g. different behaviors
  data(leroy)
  leroyB <- burst(x=leroy,f=c(rep(c("Behav.1","Behav.2"),each=400),rep("Behav.1", 118)))
  leroyBp <- spTransform(leroyB, CRSobj="+proj=aeqd +ellps=WGS84", center=TRUE)
  leroyBdbb <- brownian.bridge.dyn(object=leroyBp[750:850], location.error=12, raster=600, 
                                   ext=.45, time.step=15/15, margin=15)
  leoryBud <- UDStack(leroyBdbb)
  values(leoryBud)[values(getVolumeUD(leoryBud))>.999999]<-0
  stk2<-(leoryBud/cellStats(leoryBud,sum))
  emd(stk2)



