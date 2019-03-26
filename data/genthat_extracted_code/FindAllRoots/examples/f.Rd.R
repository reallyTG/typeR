library(FindAllRoots)


### Name: f
### Title: function returning one function value, or a vector of function
###   values.
### Aliases: f

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
a=c(2,-1,-13,-1,-5)
b=c(4:0)
x=c(1:3)
f(x,a,b)

## The function is currently defined as
function (x, a, b) 
{
    z = 0
    for (i in 1:length(b)) z = z + a[i] * x^(b[i])
    z
  }



