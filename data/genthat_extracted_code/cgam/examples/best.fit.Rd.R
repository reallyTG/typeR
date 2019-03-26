library(cgam)


### Name: best.fit
### Title: Extract the Best Fit Returned by the ShapeSelect Routine
### Aliases: best.fit
### Keywords: best fit of the ShapeSelect routine

### ** Examples

## Not run: 
##D   library(MASS)
##D   data(Rubber)
##D 
##D   # do a variable and shape selection with four possible shapes
##D   # increasing, decreasing, convex and concave 
##D   ans <- ShapeSelect(loss ~ shapes(hard, set = c("incr", "decr", "conv", "conc"))
##D   + shapes(tens, set = c("incr", "decr", "conv", "conc")), data = Rubber, genetic = TRUE)
##D 
##D   # check the best fit, which is an object of the cgam class
##D   bf <- best.fit(ans)
##D   class(bf)
##D   plotpersp(bf)
## End(Not run)



