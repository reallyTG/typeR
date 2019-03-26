library(cancerTiming)


### Name: plotCopies
### Title: plot segmentation values against each other
### Aliases: plotCopies

### ** Examples

cp1<-c(0,0,0,1,1,1,1,2,2,2,3,3,3)
cp2<-c(0,1,2,1,2,2,3,2,2,4,3,6,8)
seg1<-jitter(c(0,0,0,1,1,1,1,2,2,2,3,3,3))
seg2<-jitter(c(0,1,2,1,2,2,3,2,2,4,3,6,8))
plotCopies(x=seg1,y=seg2,nX=cp1,nY=cp2)



