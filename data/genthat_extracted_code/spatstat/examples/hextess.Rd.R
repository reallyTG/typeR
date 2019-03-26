library(spatstat)


### Name: hextess
### Title: Hexagonal Grid or Tessellation
### Aliases: hexgrid hextess
### Keywords: spatial datagen

### ** Examples

  if(interactive()) {
    W <- Window(chorley)
    s <- 0.7
  } else {
    W <- letterR
    s <- 0.3
  }
  plot(hextess(W, s))
  plot(hexgrid(W, s), add=TRUE)



