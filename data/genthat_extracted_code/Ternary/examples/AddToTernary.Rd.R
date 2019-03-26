library(Ternary)


### Name: AddToTernary
### Title: Add elements to ternary plot
### Aliases: AddToTernary TernaryPoints TernaryText TernaryLines
###   TernaryPolygon JoinTheDots

### ** Examples

{
  coords <- list(
    A = c(1, 0, 2),
    B = c(1, 1, 1),
    C = c(1.5, 1.5, 0),
    D = c(0.5, 1.5, 1)
  )
  TernaryPlot()
  AddToTernary(lines, coords, col='green', lwd=2)
  TernaryLines(coords, col='red', lty='dotted')
  TernaryText(coords, cex=0.7, col='red')
  TernaryPoints(coords, pch=1, cex=2, col='blue')
  AddToTernary(points, coords, pch=1, cex=3)
}




