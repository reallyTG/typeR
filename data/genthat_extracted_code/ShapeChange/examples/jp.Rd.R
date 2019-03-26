library(ShapeChange)


### Name: jp
### Title: Specify a Jump-Point Category in a CHANGEPT Formula
### Aliases: jp
### Keywords: symbolic routine

### ** Examples

## Not run: 
##D   # simulated curve with an upward jump at .7
##D   n = 1000
##D   x = seq(1/n, 1, length = n)
##D 
##D   set.seed(123) 
##D   y =  4 * sin(5 * x) + 3 * x + (x >= .7) + rnorm(n, sd = 1)
##D   ans = changept(y ~ jp(x))
##D 
##D   plot(ans)
## End(Not run) 



