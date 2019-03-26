library(dsmodels)


### Name: dsarrows
### Title: Add a visualization of the system using arrows
### Aliases: dsarrows

### ** Examples

library(dsmodels)

fun <- function(X,Y) {
  list(
    X/exp(Y),
    Y/exp(X)
  )
}
model <- dsmodel(fun, title = "Blue Arrows")
range <- dsrange(x = -2:3, y = -2:3, discretize = .5)
model + range + dsarrows()

dsmodel(fun, title = "Spaced Purple Arrows") +
 dsrange(x = -2:3, y = -2:3, discretize = .5) +
 dsarrows(discretize = 1, col = "magenta")



