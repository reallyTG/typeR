library(spatstat)


### Name: complement.owin
### Title: Take Complement of a Window
### Aliases: complement.owin
### Keywords: spatial math

### ** Examples

   # rectangular
   a <- owin(c(0,1),c(0,1))
   b <- owin(c(-1,2),c(-1,2))
   bmina <- complement.owin(a, frame=b)
   # polygonal
   data(demopat)
   w <- Window(demopat)
   outside <- complement.owin(w)
   # mask
   w <- as.mask(Window(demopat))
   outside <- complement.owin(w)



