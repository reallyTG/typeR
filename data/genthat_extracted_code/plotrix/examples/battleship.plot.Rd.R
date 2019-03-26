library(plotrix)


### Name: battleship.plot
### Title: Display a matrix of values as the widths of stacked rectangles
### Aliases: battleship.plot
### Keywords: misc

### ** Examples

 x<-matrix(sample(10:50,100,TRUE),10)
 xaxlab=c("One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten")
 yaxlab=c("First","Second","Third","Fourth","Fifth","Sixth","Seventh",
  "Eighth","Ninth","Tenth")
 battleship.plot(x,xlab="The battle has just begun",main="Battleship1",
  xaxlab=xaxlab,yaxlab=yaxlab)



