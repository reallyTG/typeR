library(dsmodels)


### Name: xlabel
### Title: Create a label on the x-axis
### Aliases: xlabel

### ** Examples

 library(dsmodels)
 fun <- function(X,Y) {
 list(
     X/exp(Y),
     Y/exp(X)
  )
}

model <- dsmodel(fun, title = "Cool Function!")
model + dsrange(-2:3,-2:3, discretize = .09) +
 xlabel("X-Axis shows $\\alpha$!") +
 ylabel("Y-Axis shows $\\beta$!")



