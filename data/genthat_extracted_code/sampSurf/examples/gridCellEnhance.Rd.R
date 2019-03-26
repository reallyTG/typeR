library(sampSurf)


### Name: gridCellEnhance
### Title: Add Grid Lines and Centers in Package "sampSurf"
### Aliases: gridCellEnhance
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# apply it after plotting a sampling surface...
#
tr = Tract(c(x=50,y=50), cellSize=0.5)
btr = bufferedTract(10, tr)
ssSA = sampSurf(2, btr, iZone = 'sausageIZ', plotRadius=3,
       buttDiam=c(20,40))
plot(ssSA, axes=TRUE)
gridCellEnhance(ssSA@tract, gridLines=TRUE)

#
# on a tract only...
#
plot(btr, axes=TRUE, gridCenters=TRUE)



