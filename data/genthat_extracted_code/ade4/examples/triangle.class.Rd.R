library(ade4)


### Name: triangle.class
### Title: Triangular Representation and Groups of points
### Aliases: triangle.class
### Keywords: hplot

### ** Examples

if(!adegraphicsLoaded()) {
  data(euro123)
  par(mfrow = c(2, 2))
  x <- rbind.data.frame(euro123$in78, euro123$in86, euro123$in97)
  triangle.plot(x)
  triangle.class(x, as.factor(rep("G", 36)), csta = 0.5, cell = 1)
  triangle.class(x, euro123$plan$an)
  triangle.class(x, euro123$plan$pays)
  triangle.class(x, euro123$plan$an, cell = 1, axesell = TRUE)
  triangle.class(x, euro123$plan$an, cell = 0, csta = 0, 
    col = c("red", "green", "blue"), axesell = TRUE, clab = 2, cpoi = 2)
  triangle.class(x, euro123$plan$an, cell = 2, csta = 0.5, 
    axesell = TRUE, clab = 1.5)
  triangle.class(x, euro123$plan$an, cell = 0, csta = 1, scale = FALSE, 
    draw.line = FALSE, show.posi = FALSE)
  par(mfrow = c(2, 2))
}


