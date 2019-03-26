library(plotrix)


### Name: cylindrect
### Title: Display an apparent cylinder
### Aliases: cylindrect
### Keywords: misc

### ** Examples

 plot(0,xlim=c(0,5),ylim=c(0,5),main="Examples of pseudocylindrical rectangles",
  xlab="",ylab="",axes=FALSE,type="n")
 cylindrect(0,0,1,5,"red")
 cylindrect(rep(1,3),c(0,2,4),rep(4,3),c(1,3,5),"green",gradient="y")
 cylindrect(4,0,5,5,"#8844aa")



