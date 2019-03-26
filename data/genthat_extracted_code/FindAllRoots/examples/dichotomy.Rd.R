library(FindAllRoots)


### Name: dichotomy
### Title: Find root(s) of the equation by dichotomy
### Aliases: dichotomy

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
a=c(2,-1,-13,-1,-5)
b=c(4:0)
x1=c(1:10)
x2=c(2:11)
dichotomy(x1,x2,a,b)

## The function is currently defined as
function (x1, x2, a, b, pert = 10^(-5), n = 1000, s = 0.1) 
{
    x0 = rep(NA, length(x1))
    for (i in 1:length(x1)) {
        if (f(x1[i], a, b) == 0) 
            x0[i] = x1[i]
        if (f(x2[i], a, b) == 0) 
            x0[i] = x2[i]
        if (f(x1[i], a, b) != 0 & f(x2[i], a, b) != 0) {
            x0[i] = (x1[i] + x2[i])/2
            k = 1
            while ((abs(f(x0[i], a, b)) >= pert) & (k < n)) {
                if (f(x0[i], a, b) == 0) 
                  break
                if (f(x1[i], a, b) * f(x0[i], a, b) < 0) 
                  x2[i] = x0[i]
                if (f(x2[i], a, b) * f(x0[i], a, b) < 0) 
                  x1[i] = x0[i]
                if (x1[i] != x0[i] & x2[i] != x0[i]) 
                  x2[i] = x2[i] - s
                x0[i] = (x1[i] + x2[i])/2
                k = k + 1
                if (k == 1000) 
                  x0[i] = NA
            }
        }
    }
    x0
  }



