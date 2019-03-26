library(FuzzyNumbers.Ext.2)


### Name: is.increasing.on.y
### Title: Diagnosis an increasing two-variable function toward y
### Aliases: is.increasing.on.y
### Keywords: monoton function is.increasing is.decreasing
###   is.increasing.on.x is.decreasing.on.x is.increasing.on.y
###   is.decreasing.on.y

### ** Examples

is.increasing.on.y(fun=function(x,y) 2*x+y, x.bound=c(0,2), y.bound=c(1,2), step=.2)

f = function(x,y) 5*x+y^2
is.increasing.on.y(f, x.bound=c(0,2), y.bound=c(0,2))
is.increasing.on.y(f, x.bound=c(-2,2), y.bound=c(0,2))
is.increasing.on.y(f, x.bound=c(0,2), y.bound=c(-2,2))

H = function(x,y) pnorm(x)+y^2
is.increasing.on.x(H)
is.increasing.on.y(H)
is.increasing.on.y(H, x.bound=c(-3,3), y.bound=c(0,3))

## The function is currently defined as
function (fun, x.bound = c(-1, 1), y.bound = c(-1, 1), step = 0.01) 
{
    x = seq(x.bound[1], x.bound[2], by = step)
    for (i in 1:length(x)) {
        g = function(y) fun(x[i], y)
        if (is.increasing(g, y.bound, step) == FALSE) {
            return(FALSE)
        }
    }
    return(TRUE)
  }



