library(FuzzyNumbers.Ext.2)


### Name: is.decreasing
### Title: Diagnosis a decreasing function
### Aliases: is.decreasing
### Keywords: monoton function is.increasing is.decreasing
###   is.increasing.on.x is.decreasing.on.x is.increasing.on.y
###   is.decreasing.on.y

### ** Examples

is.decreasing(fun=function(x) -2*x+10, x.bound=c(4,6), step=.1)

g = function(x) x^3
is.decreasing(g, x.bound=c(-24,6))

## The function is currently defined as
function (fun, x.bound = c(-1, 1), step = 0.01) 
{
    x = seq(x.bound[1], x.bound[2], by = step)
    i = 1
    while (fun(x[i]) >= fun(x[i + 1])) {
        if (i < length(x) - 1) {
            i <- i + 1
        }
        else (return(TRUE))
    }
    return(FALSE)
  }



