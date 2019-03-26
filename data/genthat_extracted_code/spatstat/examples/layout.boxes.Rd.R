library(spatstat)


### Name: layout.boxes
### Title: Generate a Row or Column Arrangement of Rectangles.
### Aliases: layout.boxes
### Keywords: utilities

### ** Examples

  B <- owin(c(0,10),c(0,1))
  boxes <- layout.boxes(B, 5, horizontal=TRUE)
  plot(B, main="", col="blue")
  niets <- lapply(boxes, plot, add=TRUE, col="grey")



