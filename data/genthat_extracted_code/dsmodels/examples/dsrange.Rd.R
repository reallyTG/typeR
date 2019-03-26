library(dsmodels)


### Name: dsrange
### Title: Range of inputs for a model
### Aliases: dsrange

### ** Examples

fun <- function(X,Y) {
  list(
    X/exp(Y),
    Y/exp(X)
  )
}
model <- dsmodel(fun, title = "A range with no features!")
#Since no features are added, only the area and title are displayed.
model + dsrange(3, 3, discretize = .09)



