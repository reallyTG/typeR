library(logbin)


### Name: interpret.logbin.smooth
### Title: Interpret a logbin.smooth Formula
### Aliases: interpret.logbin.smooth
### Keywords: smooth models

### ** Examples

# Specify a smooth model with knot.range
res <- interpret.logbin.smooth(y ~ B(x, knot.range = 0:2) + x2)
# The knot.range is removed from the full.formula...
print(res$full.formula)
# ...but is stored in the $smooth.spec component of the result:
print(res$smooth.spec$x$knot.range)



