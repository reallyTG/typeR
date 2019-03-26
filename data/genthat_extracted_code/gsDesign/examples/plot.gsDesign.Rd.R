library(gsDesign)


### Name: plot.gsDesign
### Title: 2.3: Plots for group sequential designs
### Aliases: plot.gsDesign plot.gsProbability 'Plots for group sequential
###   designs'
### Keywords: design

### ** Examples

#  symmetric, 2-sided design with O'Brien-Fleming-like boundaries
#  lower bound is non-binding (ignored in Type I error computation)
#  sample size is computed based on a fixed design requiring n=100
x <- gsDesign(k=5, test.type=2, n.fix=100)
x

# the following translate to calls to plot.gsDesign since x was
# returned by gsDesign; run these commands one at a time
plot(x)
plot(x, plottype=2)
plot(x, plottype=3)
plot(x, plottype=4)
plot(x, plottype=5)
plot(x, plottype=6)
plot(x, plottype=7)

#  choose different parameter values for power plot
#  start with design in x from above
y <- gsProbability(k=5, theta=seq(0, .5, .025), x$n.I,
                   x$lower$bound, x$upper$bound)

# the following translates to a call to plot.gsProbability since
# y has that type
plot(y)



