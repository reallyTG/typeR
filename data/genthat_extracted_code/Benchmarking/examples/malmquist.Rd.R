library(Benchmarking)


### Name: malmquist
### Title: Malmquist index for fimrs in a panel
### Aliases: malmquist
### Keywords: efficiencies Malmquist panel

### ** Examples

   x0 <- matrix(c(10, 28, 30, 60),ncol=1)
   y0 <- matrix(c(5, 7, 10, 15),ncol=1)
   x1 <- matrix(c(12, 26, 16, 60 ),ncol=1)
   y1 <- matrix(c(6, 8, 9, 15 ),ncol=1)

   dea.plot(x0, y0, RTS="vrs", txt=TRUE)
   dea.plot(x1, y1, RTS="vrs", add=TRUE, col="red")
   points(x1, y1, col="red", pch=16)
   text(x1, y1, 1:dim(x1)[1], col="red", adj=-1)

   X <- rbind(x0, x1)
   Y <- rbind(y0, y1)
   ID <- rep(1:dim(x1)[1], 2)
   TIME <- c(rep(0,dim(x1)[1]), rep(1,dim(x1)[1]))
   mq <- malmquist(X,Y, ID, TIME=TIME) 
   mq$tc  # Technical change
   mq$m   # Malmquist index for productivity change



