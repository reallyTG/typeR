library(NORMT3)


### Name: dst
### Title: Density function of sphered Student's t distribution
### Aliases: dst
### Keywords: distribution

### ** Examples

dst(0)
#
# Should be  2/pi = 0.6366198
#
x <- seq(from=-5, to=5, length=100)
plot(x, dst(x), type="l")	# Produces a density plot



