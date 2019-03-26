library(FuzzyNumbers.Ext.2)


### Name: is.decreasing.on.y
### Title: Diagnosis a decreasing two-variable function toward y
### Aliases: is.decreasing.on.y
### Keywords: monoton function is.increasing is.decreasing
###   is.increasing.on.x is.decreasing.on.x is.increasing.on.y
###   is.decreasing.on.y

### ** Examples

is.decreasing.on.y(fun=function(x,y) 2*x-y, x.bound=c(0,2), y.bound=c(1,2), step=.2)

H = function(x,y) pnorm(x)-pnorm(y)
is.decreasing.on.x(H)
is.decreasing.on.y(H)

## The function is currently defined as
function (fun, x.bound = c(-1, 1), y.bound = c(-1, 1), step = 0.01) 
{
    x = seq(x.bound[1], x.bound[2], by = step)
    for (i in 1:length(x)) {
        g = function(y) fun(x[i], y)
        if (is.decreasing(g, y.bound, step) == FALSE) {
            return(FALSE)
        }
    }
    return(TRUE)
  }



