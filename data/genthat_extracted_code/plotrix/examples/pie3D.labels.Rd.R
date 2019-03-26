library(plotrix)


### Name: pie3D.labels
### Title: Display labels on a 3D pie chart
### Aliases: pie3D.labels
### Keywords: misc

### ** Examples

 pieval<-c(2,4,6,8)
 bisectors<-pie3D(pieval,explode=0.1,main="3D PIE OPINIONS")
 pielabels<-
  c("We hate\n pies","We oppose\n  pies","We don't\n  care","We just love pies")
 pie3D.labels(bisectors,labels=pielabels)



