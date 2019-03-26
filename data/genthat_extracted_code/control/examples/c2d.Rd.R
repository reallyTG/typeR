library(control)


### Name: c2d
### Title: Continuous Time model conversion to Discrete Time model.
### Aliases: c2d

### ** Examples


## for TF
c2d(tf(c(1,-1), c(1,4,5)), 0.1)
## for ZPK
sys <- zpkdata( tf(c(1,-1), c(1,4,5)) )
c2d(sys, 0.1)
c2d(zpkdata( tf(c(1,-1), c(1,4,5)) ), 0.1)




