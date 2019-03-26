library(Fragman)


### Name: arrange.jm
### Title: Arrange data converted to joinmap code into a joinmap readable
###   file
### Aliases: arrange.jm

### ** Examples

xx <- data.frame(cbind(a=rep(150, 96), b=c(rep(100,48), rep(150,48)))); xx[1,] <- c(150,150)
xx2 <- cbind(jm.conv(xx), jm.conv(xx), jm.conv(xx))
xx3 <- arrange.jm(xx2, par=FALSE) 
xx3[,1:10]



