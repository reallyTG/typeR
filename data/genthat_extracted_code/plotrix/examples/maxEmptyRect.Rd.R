library(plotrix)


### Name: maxEmptyRect
### Title: Find an empty space on a plot
### Aliases: maxEmptyRect
### Keywords: misc

### ** Examples

 x<-runif(100)
 y<-runif(100)
 plot(x,y,main="Find the maximum empty rectangle",xlab="X",ylab="Y")
 mer<-maxEmptyRect(c(0,1),c(0,1),x,y)
 rect(mer$rect[1],mer$rect[2],mer$rect[3],mer$rect[4],border="red")



