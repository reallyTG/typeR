library(spatstat)


### Name: commonGrid
### Title: Determine A Common Spatial Domain And Pixel Resolution
### Aliases: commonGrid
### Keywords: spatial manip

### ** Examples

   A <- setcov(square(1))
   G <- density(runifpoint(42), dimyx=16)
   H <- commonGrid(A, letterR, G)
   newR <- as.mask(letterR, xy=H)
   newG <- as.im(G, W=H)



