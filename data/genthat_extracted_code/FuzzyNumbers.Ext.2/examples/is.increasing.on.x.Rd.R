library(FuzzyNumbers.Ext.2)


### Name: is.increasing.on.x
### Title: Diagnosis an increasing two-variable function toward x
### Aliases: is.increasing.on.x
### Keywords: monoton function is.increasing is.decreasing
###   is.increasing.on.x is.decreasing.on.x is.increasing.on.y
###   is.decreasing.on.y

### ** Examples

is.increasing.on.x(fun=function(x,y) 2*x+y, x.bound=c(0,2), y.bound=c(1,2), step=.2)

f = function(x,y) x^2+y
is.increasing.on.x(f, x.bound=c(0,2), y.bound=c(0,2))
is.increasing.on.x(f, x.bound=c(-2,2), y.bound=c(0,2))
is.increasing.on.x(f, x.bound=c(0,2), y.bound=c(-2,2))

## The function is currently defined as
function (fun, x.bound = c(-1, 1), y.bound = c(-1, 1), step = 0.01) 
{
    y = seq(y.bound[1], y.bound[2], by = step)
    for (i in 1:length(y)) {
        g = function(x) fun(x, y[i])
        if (is.increasing(g, x.bound, step) == FALSE) {
            return(FALSE)
        }
    }
    return(TRUE)
  }



