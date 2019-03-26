library(dsmodels)


### Name: dsmodel
### Title: Defines a model object encapsulating a dynamical system
### Aliases: dsmodel

### ** Examples

library(dsmodels)

fun <- function(X,Y) {
  list(
    x = X/exp(Y),
    y = Y/exp(X)
  )
}
# Add dsRange to see the actual range.
model <- dsmodel(fun)

dsmodel(function(x,y) {
  list(
    x = x^2,
    y = x/(y+1)
  )
}, title = "Another function showing $f(x)=x^{\\alpha}$!")



