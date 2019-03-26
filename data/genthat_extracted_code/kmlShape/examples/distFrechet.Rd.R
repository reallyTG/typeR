library(kmlShape)


### Name: distFrechet
### Title: ~ Function: Frechet distance ~
### Aliases: distFrechet distFrechetR distFrechetRec

### ** Examples

   Px <- 1:20
   Py <- dnorm(1:20,12,2)
   Qx <- 1:20
   Qy <- dnorm(1:20,8,2)

   ### Function from Eiter and Mannila compiled in C
   system.time(cat("\n",distFrechet(Px,Py,Qx,Qy)))

   ### Same thing in R
   system.time(cat("\n",distFrechetR(Px,Py,Qx,Qy)))

   ### Frechet using sum instead of max.
   distFrechet(Px,Py,Qx,Qy,FrechetSumOrMax="sum")



