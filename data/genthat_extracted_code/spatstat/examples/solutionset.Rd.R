library(spatstat)


### Name: solutionset
### Title: Evaluate Logical Expression Involving Pixel Images and Return
###   Region Where Expression is True
### Aliases: solutionset
### Keywords: spatial programming manip

### ** Examples

  # test images
  X <- as.im(function(x,y) { x^2 - y^2 }, unit.square())
  Y <- as.im(function(x,y) { 3 * x + y  - 1}, unit.square())

  W <- solutionset(abs(X) > 0.1)
  W <- solutionset(X > Y)
  W <- solutionset(X + Y >= 1)

  area(solutionset(X < Y))

  solutionset(density(cells) > 20)



