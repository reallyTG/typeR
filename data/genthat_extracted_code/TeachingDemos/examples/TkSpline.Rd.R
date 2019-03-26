library(TeachingDemos)


### Name: TkSpline
### Title: Plot a set of data in a Tk window and interactively move a line
###   to see predicted y-values from a spline fit corresponding to selected
###   x-values.
### Aliases: TkSpline
### Keywords: dplot dynamic

### ** Examples

if(interactive()) {
  x <- 1:10
  y <- sin(x)
  TkSpline(x,y, xlim=c(0,11))
}



