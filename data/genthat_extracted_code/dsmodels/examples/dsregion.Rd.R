library(dsmodels)


### Name: dsregion
### Title: Colored polygonal region
### Aliases: dsregion dspolygon

### ** Examples

library(dsmodels)

fun <- function(X,Y) {
  list(
    X/exp(Y),
    Y/exp(X)
  )
}
model <- dsmodel(fun, title = "Regions!")
range <- dsrange(3, 3, discretize = .09)
model+range

# dspolygon usage
model + dspolygon(x = c(-.05,3,3),
                  y = c(0,0,3),
                  col = "yellow")
a <- dspoint(3,3)
b <- dspoint(2.5,3)
c <- dspoint(2,2)

# Different inputs for dsregion shown below

model + dsregion(a, b, c, col = "orange") +
	dsregion(pnt(0,0),pnt(1,0),pnt(1,1),pnt(0,1), col = "green") +
	dsregion(c(1,1),c(2,1),c(2,2),c(1,2), c(1.8,1.5), col = "magenta")



