library(plotrix)


### Name: rectFill
### Title: Draw a rectangle filled with symbols
### Aliases: rectFill
### Keywords: misc

### ** Examples

 plot(1:7,type="n",xlab="",ylab="",main="Test of rectFill")
 rectFill(1:6,1:6,2:7,2:7,bg=2:7,pch=c("+","*","o",".","#","^"),
  xinc=c(0.2,0.1,0.2,0.1,0.2,0.2),yinc=c(0.2,0.1,0.2,0.1,0.2,0.2),
  pch.col=1:6)
 barp(matrix(runif(9),nrow=3),main="Black and white bar plot",pch=1:3)



