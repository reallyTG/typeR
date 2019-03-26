library(pgirmess)


### Name: trans2pix
### Title: Convert a transect coordinate file with some waypoints separated
###   by NA into a matrix with intermediate coordinates replacing NA.
### Aliases: trans2pix
### Keywords: utilities, spatial

### ** Examples


x<-c(10,NA, NA, NA,56,NA,NA,100)
y<-c(23,NA, NA, NA,32,NA,NA,150)
cols=c("red","blue","blue","blue","red","blue","blue","red")
plot(x,y,col=cols,pch=19)
plot(trans2pix(cbind(x,y)),col=cols,pch=19)




