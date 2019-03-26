library(splancs)


### Name: mse2d
### Title: Mean Square Error for a Kernel Smoothing
### Aliases: mse2d
### Keywords: spatial

### ** Examples

data(bodmin)
Mse2d <- mse2d(as.points(bodmin), bodmin$poly, nsmse=50, range=8)
plot(Mse2d$h[5:50],Mse2d$mse[5:50], type="l")



