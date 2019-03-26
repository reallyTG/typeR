library(longitudinalData)


### Name: distFrechet
### Title: ~ Function: Frechet distance ~
### Aliases: distFrechet

### ** Examples

   Px <- 1:20
   Py <- dnorm(1:20,12,2)
   Qx <- 1:20
   Qy <- dnorm(1:20,8,2)

   distFrechet(Px,Py,Qx,Qy)

   ### Frechet using sum instead of max.
   distFrechet(Px,Py,Qx,Qy,FrechetSumOrMax="sum")



