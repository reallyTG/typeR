library(circular)


### Name: circularp
### Title: Attributes for a Circular Object
### Aliases: circularp circularp<-
### Keywords: misc

### ** Examples

x <- pi
circularp(x) # now NULL
circularp(x) <- list(type="angles", units="radians", template="none", 
  modulo="asis", zero=0, rotation="counter")
circularp(x)
x
class(x) <- "circular" # now we set also the class so that print.circular is used
x



