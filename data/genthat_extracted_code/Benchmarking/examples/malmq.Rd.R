library(Benchmarking)


### Name: malmq
### Title: Malmquist index
### Aliases: malmq
### Keywords: efficiencies Malmquist

### ** Examples

   x0 <- matrix(c(10, 28, 30, 60),ncol=1)
   y0 <- matrix(c(5, 7, 10, 15),ncol=1)
   x1 <- matrix(c(12, 26, 16, 60 ),ncol=1)
   y1 <- matrix(c(6, 8, 9, 15 ),ncol=1)

   dea.plot(x0, y0, RTS="vrs", txt=TRUE)
   dea.plot(x1, y1, RTS="vrs", add=TRUE, col="red")
   points(x1, y1, col="red", pch=16)
   text(x1, y1, 1:dim(x1)[1], col="red", adj=-1)

   m <- malmq(x0,y0,,x1,y1,,RTS="vrs")
   print("Malmquist index for change in productivity, technoligy change:")
   print(m$mq)
   print("Index for change of frontier:")
   print(m$tc)



