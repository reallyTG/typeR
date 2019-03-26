library(FuzzyNumbers.Ext.2)


### Name: is.increasing
### Title: Diagnosis an increasing function
### Aliases: is.increasing
### Keywords: monoton function is.increasing is.decreasing
###   is.increasing.on.x is.decreasing.on.x is.increasing.on.y
###   is.decreasing.on.y

### ** Examples

is.increasing(fun=function(x) 2*x, x.bound=c(4,6), step=.1)

g = function(x) x^2
is.increasing(g, x.bound=c(-24,6), step=.01)

h = function(x) x^5
is.increasing(h, c(-24,6), .01)
curve(h(x), xlim=c(-2,2))


## The function is currently defined as
function (fun, x.bound = c(-1, 1), step = 0.01) 
{
    x = seq(x.bound[1], x.bound[2], by = step)
    i = 1
    while (fun(x[i]) <= fun(x[i + 1])) {
        if (i < length(x) - 1) {
            i <- i + 1
        }
        else (return(TRUE))
    }
    return(FALSE)
  }



