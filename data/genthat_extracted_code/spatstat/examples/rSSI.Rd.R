library(spatstat)


### Name: rSSI
### Title: Simulate Simple Sequential Inhibition
### Aliases: rSSI
### Keywords: spatial datagen

### ** Examples

 Vinf <- rSSI(0.07)

 V100 <- rSSI(0.07, 100)

 X <- runifpoint(100)
 Y <- rSSI(0.03,142,x.init=X) # Y consists of X together with
                              # 42 added points.
 plot(Y, main="rSSI")
 plot(X,add=TRUE,chars=20,cols="red")

 ## inhomogeneous
 Z <- rSSI(0.07, 50, f=function(x,y){x})
 plot(Z)



