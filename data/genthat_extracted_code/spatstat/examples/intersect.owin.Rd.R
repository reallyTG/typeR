library(spatstat)


### Name: intersect.owin
### Title: Intersection, Union or Set Subtraction of Windows
### Aliases: intersect.owin union.owin setminus.owin
### Keywords: spatial math

### ** Examples

# rectangles
   u <- unit.square()
   v <- owin(c(0.5,3.5), c(0.4,2.5))
# polygon
   data(letterR)
# mask
   m <- as.mask(letterR)

# two rectangles
   intersect.owin(u, v) 
   union.owin(u,v)
   setminus.owin(u,v)

# polygon and rectangle
   intersect.owin(letterR, v)
   union.owin(letterR,v)
   setminus.owin(letterR,v)

# mask and rectangle
   intersect.owin(m, v)
   union.owin(m,v)
   setminus.owin(m,v)

# mask and polygon
   p <- rotate(v, 0.2)
   intersect.owin(m, p)
   union.owin(m,p)
   setminus.owin(m,p)

# two polygons
   A <- letterR
   B <- rotate(letterR, 0.2)
   plot(boundingbox(A,B), main="intersection")
   w <- intersect.owin(A, B)
   plot(w, add=TRUE, col="lightblue")
   plot(A, add=TRUE)
   plot(B, add=TRUE)

   plot(boundingbox(A,B), main="union")
   w <- union.owin(A,B)
   plot(w, add=TRUE, col="lightblue")   
   plot(A, add=TRUE)
   plot(B, add=TRUE)

   plot(boundingbox(A,B), main="set minus")
   w <- setminus.owin(A,B)
   plot(w, add=TRUE, col="lightblue")   
   plot(A, add=TRUE)
   plot(B, add=TRUE)

# intersection and union of three windows
   C <- shift(B, c(0.2, 0.3))
   plot(union.owin(A,B,C))
   plot(intersect.owin(A,B,C))



