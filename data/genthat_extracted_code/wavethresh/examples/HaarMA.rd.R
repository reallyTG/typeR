library(wavethresh)


### Name: HaarMA
### Title: Generate Haar MA processes.
### Aliases: HaarMA
### Keywords: manip

### ** Examples

#
# Generate a Haar MA process of order 1 (high frequency series)
#
MyHaarMA <- HaarMA(n=151, sd=2, order=1)
#
# Plot it
#
## Not run: ts.plot(MyHaarMA)
#
# Generate another Haar MA process of order 3 (lower frequency), but of
# smaller variance
#
MyHaarMA2 <- HaarMA(n=151, sd=1, order=3)
#
# Plot it
#
## Not run: ts.plot(MyHaarMA2)
#
# Let's plot them next to each other so that you can really see the
# differences.
# 
# Plot a vertical dotted line which indicates where the processes are
# joined
#
## Not run: ts.plot(c(MyHaarMA, MyHaarMA2))
## Not run: abline(v=152, lty=2)



