library(move)


### Name: UDStack
### Title: Creating UDStack objects
### Aliases: UDStack UDStack,RasterBrick-method UDStack,list-method
###   UDStack,RasterStack-method UDStack,.UDBurstStack-method

### ** Examples

data(dbbmmstack)
stk<-as(dbbmmstack,"RasterStack")
UDStack(stk)
lst<-split(dbbmmstack)
UDStack(lst)

## transforming a DBBMMBurstStack into UDStack, e.g. to than 
## use the "getVolumeUD" or "emd" function
data(leroy)
leroyB <- burst(x=leroy,f=c(rep(c("Behav.1","Behav.2"),each=400),rep("Behav.1", 118)))
leroyBdbb <- brownian.bridge.dyn(object=spTransform(leroyB[785:820], center=TRUE), 
                                 location.error=12, dimSize=115, ext=.45, 
                                 time.step=25/15, margin=15)
cellStats(leroyBdbb, sum)
leroyBud <- UDStack(leroyBdbb)
cellStats(leroyBud, sum)



