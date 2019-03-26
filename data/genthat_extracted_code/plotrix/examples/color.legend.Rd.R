library(plotrix)


### Name: color.legend
### Title: Legend matching categories or values to colors
### Aliases: color.legend
### Keywords: misc

### ** Examples

 # get some extra room
 par(mar=c(7,4,4,6))
 testcol<-color.gradient(c(0,1),0,c(1,0),nslices=5)
 col.labels<-c("Cold","Warm","Hot")
 # this will put the labels at the intersections
 # col.labels<-c("","Cold","","Warm","","Warmer","","Hot","")
 color2D.matplot(matrix(rnorm(100),nrow=10),c(1,0),0,c(0,1),
  main="Test color legends")
 color.legend(11,6,11.8,9,col.labels,testcol,gradient="y")
 color.legend(10.2,2,11,5,col.labels,testcol,align="rb",gradient="y")
 color.legend(0.5,-2,3.5,-1.2,col.labels,testcol)
 color.legend(7,-1.8,10,-1,col.labels,testcol,align="rb",col=testcol[c(1,3,5)])
 par(mar=c(5,4,4,2))



