library(dsmodels)


### Name: dscurve
### Title: Parametric curves or a graph of functions
### Aliases: dscurve

### ** Examples

library(dsmodels)

fun <- function(X,Y) {
  list(
    X/exp(Y),
    Y/exp(X)
  )
}

model <- dsmodel(fun, title = "Points on a One-Dimensional Curve")
range <- dsrange(-2:2,-2:2, discretize = 0.5)

# Add the graph of a function and its image in blue.
graphcrv <- dscurve(function(x) x^2,
                    col = "orange",
                    image = "blue",
                    discretize = TRUE,
                    xlim = c(-2,2))
model + range +	graphcrv
# Add the graph of expression of x.
model + dscurve(x^2+1, col="yellow")

# Create a parametric curve with image iterations red then green.
paramcrv <- dscurve(function(t) t^2, function(t) t,
                    image = c("red", "green"),
                    tstart = -2, tend = 2)
dsmodel(fun, "A Parametric Curve and Iterations of that Curve") +
  dsrange(-2:2, -2:2, discretize = 0.5) +
# A parametic curve defined by expressions of t.
  paramcrv + dscurve(4*t-2,4*t-2,col="blue")




