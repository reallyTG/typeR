library(spatstat)


### Name: distfun
### Title: Distance Map as a Function
### Aliases: distfun distfun.ppp distfun.psp distfun.owin
### Keywords: spatial math

### ** Examples

   data(letterR)
   f <- distfun(letterR)
   f
   plot(f)
   f(0.2, 0.3)

   plot(distfun(letterR, invert=TRUE), eps=0.1)

   d <- distfun(cells)
   d2 <- distfun(cells, k=2)
   d(0.5, 0.5)
   d2(0.5, 0.5)
   domain(d)
   summary(d)

   z <- d(japanesepines)



