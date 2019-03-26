library(Hmisc)


### Name: mgp.axis
### Title: Draw Axes With Side-Specific mgp Parameters
### Aliases: mgp.axis mgp.axis.labels
### Keywords: iplot dplot environment

### ** Examples

## Not run: 
##D mgp.axis.labels(type='x')  # get default value for x-axis
##D mgp.axis.labels(type='y')  # get value for y-axis
##D mgp.axis.labels(type='xy') # get 2nd element of both mgps
##D mgp.axis.labels(type='x and y')  # get a list with 2 elements
##D mgp.axis.labels(c(3,.5,0), type='x')  # set
##D options('mgp.axis.labels')            # retrieve
##D 
##D plot(..., axes=FALSE)
##D mgp.axis(1, "X Label")
##D mgp.axis(2, "Y Label")
##D 
## End(Not run)


