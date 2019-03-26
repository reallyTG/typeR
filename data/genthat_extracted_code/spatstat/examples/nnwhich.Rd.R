library(spatstat)


### Name: nnwhich
### Title: Nearest neighbour
### Aliases: nnwhich nnwhich.ppp nnwhich.default
### Keywords: spatial math

### ** Examples

   data(cells)
   plot(cells)
   m <- nnwhich(cells)
   m2 <- nnwhich(cells, k=2)

   # plot nearest neighbour links
   b <- cells[m]
   arrows(cells$x, cells$y, b$x, b$y, angle=15, length=0.15, col="red")

   # find points which are the neighbour of their neighbour
   self <- (m[m] == seq(m))
   # plot them
   A <- cells[self]
   B <- cells[m[self]]
   plot(cells)
   segments(A$x, A$y, B$x, B$y)

   # nearest neighbours of each type
   head(nnwhich(ants, by=marks(ants)))



