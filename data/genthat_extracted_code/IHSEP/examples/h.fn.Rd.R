library(IHSEP)


### Name: h.fn
### Title: Mean Intensity Function of the Self-Exciting Point Process
###   'h.fn' calculate the values of the mean intensity function of the
###   self-exciting process with given baseline event rate and excitation
###   function at a (fairly large) number of points. Values of the function
###   at other points can be obtained by interpolation (e.g. spline
###   interpolation).
### Aliases: h.fn

### ** Examples

## Not run: 
##D nu <- function(x)(200+100*cos(pi*x))*(x>=0);
##D g <- function(x) 2*exp(-x)
##D h.l <- h.fn(nu=nu,g=g,to=5);
##D h <- splinefun(h.l$x,h.l$y);
##D x <- 1:500/100;
##D max(nu(x)+sapply(x,function(x)integrate(function(u)g(x-u)*h(u),0,x)$value) - h(x))
## End(Not run)



