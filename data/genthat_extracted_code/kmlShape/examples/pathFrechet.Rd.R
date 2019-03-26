library(kmlShape)


### Name: pathFrechet
### Title: ~ Function: Frechet distance ~
### Aliases: pathFrechet pathFrechetR

### ** Examples

   Px <- 1:20
   Py <- dnorm(1:20,12,2)
   Qx <- 1:20
   Qy <- dnorm(1:20,8,2)

   ### Function from Eiter and Mannila compiled in C
   system.time(pathFrechet(Px,Py,Qx,Qy))

   ### Same thing in R
   system.time(pathFrechet(Px,Py,Qx,Qy))

   ### Frechet using sum instead of max.
   pathFrechet(Px,Py,Qx,Qy,FrechetSumOrMax="sum")



