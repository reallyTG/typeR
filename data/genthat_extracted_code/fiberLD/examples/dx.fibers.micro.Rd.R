library(fiberLD)


### Name: dx.fibers.micro
### Title: Density functions of the fiber length based on microscopy data
### Aliases: dx.fibers.micro dy.fibers.micro dw.fibers.micro

### ** Examples

 library(fiberLD)
 r <- 2.5
 par <- c(1.8,2.7,2.6)
 x <- seq(.01, 2*r-.01,length=100)
 f1 <- dy.fibers.micro(x, par)
 plot(x,f1,type="l")

 f2 <- dx.fibers.micro(x, par, r)

 ## getting the density in the tree that goes beyond the length 
 ## of the diameter, 2r,... 
 w <- seq(0,8,length=200)
 f3 <- dw.fibers.micro(w, par, r)
 plot(w,f3,type="l")




