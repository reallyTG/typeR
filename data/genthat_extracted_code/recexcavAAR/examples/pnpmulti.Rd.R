library(recexcavAAR)


### Name: pnpmulti
### Title: Check if multiple points are within a polygon (2D)
### Aliases: pnpmulti

### ** Examples

polydf <- data.frame(
  x = c(1,1,2,2),
  y = c(1,2,1,2)
)

testdf <- data.frame(
  x = c(1.5, 2.5),
  y = c(1.5, 2.5)
)

pnpmulti(polydf$x, polydf$y, testdf$x, testdf$y)




