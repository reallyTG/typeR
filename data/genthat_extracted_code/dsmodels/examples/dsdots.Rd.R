library(dsmodels)


### Name: dsdots
### Title: Adds a visualization of the system using dots
### Aliases: dsdots

### ** Examples

library(dsmodels)

fun <- function(X,Y) {
  list(
    X/exp(Y),
    Y/exp(X)
  )
}

model <- dsmodel(fun, title = "View of the Discretized Field")
range <- dsrange(-2:2,-2:2, discretize = 0.09)

# To view the discretized field, simply add dsdots() to your model
model + range + dsdots()

# To view a gradient with a certain amount of iterations,
# specify the image and the amount of iterations in the image
# and iters parameters, respectively.
dsmodel(fun, title = "Gradient of Iterations from Blue to Red") +
   dsrange(-2:2,-2:2, discretize = 0.09) +
   dsdots(col = "blue", image = "red", iters = 3)

# Set color to "NA" if you wish for the specified iteration to not
# appear in the image
dsmodel(fun, title = "Display Only the Third Iteration") +
   dsrange(-2:2,-2:2, discretize = 0.09) +
   dsdots(col = "NA", image = c("NA","blue"), size = 1)



