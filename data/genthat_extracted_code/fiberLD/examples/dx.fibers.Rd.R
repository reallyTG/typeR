library(fiberLD)


### Name: dx.fibers
### Title: Density functions of the fiber lengths
### Aliases: dx.fibers dy.fibers dw.fibers

### ** Examples

 library(fiberLD)
 r <- 2.5
 par <- c(1.8,2.7,2.6)
 x <- seq(.01, 2*r-.01,length=100)
 f1 <- dy.fibers(x, par)
 plot(x,f1,type="l")

 f2 <- dx.fibers(x, par, r)
 f3 <- dw.fibers(x, par, r)

 ## the same functions can be used for plotting fine densities...
 par.fines <- c(-2, .5)
 x <- seq(0, 2,length=100)
 f1.fines <- dy.fibers(x, par.fines, model="lognorm")
 plot(x,f1.fines,type="l")
 
 ## getting the distribution in the tree that goes beyond the length 
 ## of the diameter, 2r ... 
 w <- seq(0,8,length=200)
 f5 <- dw.fibers(w,par,r) ## fiber density in the tree
 par.fines <- c(.06,1.5,3.3)
 f2.fines <- dw.fibers(w, par.fines,r)
 par(mfrow=c(1,2))
 plot(w,f5,type="l", main="fiber density")
 plot(w,f2.fines,type="l", main="fine density")




