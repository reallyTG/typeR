library(dsmodels)


### Name: dspoint
### Title: Individual points and their images
### Aliases: dspoint

### ** Examples

library(dsmodels)

fun <- function(X,Y) {
  list(
    X/exp(Y),
    Y/exp(X)
  )
}

model <- dsmodel(fun, title = "A Single Point")
model + dsrange(3,3, discretize = .09) +
	dspoint(1,2, col = "magenta")

dsmodel(fun, title = "A Point and a Label") +
 dsrange(3,3, discretize = .09) +
 dspoint(2.2, 2.1, label = "$x^{\\alpha}$", col = "green")

dsmodel(fun, title = "A Point and Iterations of that Point") +
 dsrange(3,3, discretize = .09) +
	dspoint(1,1, col = "red", image = c("orange","yellow"))

dsmodel(fun, title = "Iterations of a Point over a Color Gradient") +
 dsrange(3,3, discretize = .09) +
	dspoint(0.2, 0.5, image = "pink", iters = 3, col = "grey")



