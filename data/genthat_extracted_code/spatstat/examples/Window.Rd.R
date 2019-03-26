library(spatstat)


### Name: Window
### Title: Extract or Change the Window of a Spatial Object
### Aliases: Window Window<- Window.ppp Window<-.ppp Window.psp
###   Window<-.psp Window.im Window<-.im
### Keywords: spatial manip

### ** Examples

   ## point patterns
   Window(cells)
   X <- demopat
   Window(X)
   Window(X) <- as.rectangle(Window(X))

   ## line segment patterns
   X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
   Window(X)
   Window(X) <- square(0.5)

   ## images
   Z <- setcov(owin())
   Window(Z)
   Window(Z) <- square(0.5)



