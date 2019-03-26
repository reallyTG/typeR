library(rtop)


### Name: sceua
### Title: Optimisation with the Shuffle Complex Evolution method
### Aliases: sceua

### ** Examples

set.seed(1)
# generate example data from a function with three parameters
# with some random noise
fun = function(x, pars) pars[2]*sin(x*pars[1])+pars[3]
x = rnorm(50, sd = 3)
y = fun(x, pars = c(5, 2, 3)) +  rnorm(length(x), sd = 0.3)
plot(x,y)
   
# Objective function, summing up squared differences
OFUN = function(pars, x, yobs) {
  yvals = fun(x, pars)  
  sum((yvals-yobs)^2)
}

sceuares = sceua(OFUN, pars = c(0.1,0.1,0.1), lower = c(-10,0,-10), 
                 upper = c(10,10,10), x = x, yobs = y)
sceuares
xx = seq(min(x), max(x), 0.1)
lines(xx, fun(xx, pars = sceuares$par))




