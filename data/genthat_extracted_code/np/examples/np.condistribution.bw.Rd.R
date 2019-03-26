library(np)


### Name: npcdistbw
### Title: Kernel Conditional Distribution Bandwidth Selection with Mixed
###   Data Types
### Aliases: npcdistbw npcdistbw.NULL npcdistbw.condbandwidth
###   npcdistbw.default npcdistbw.formula
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we compute the
##D # cross-validated bandwidths (default) using a second-order Gaussian
##D # kernel (default). Note - this may take a minute or two depending on
##D # the speed of your computer.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D bw <- npcdistbw(formula=gdp~ordered(year))
##D 
##D # The object bw can be used for further estimation using
##D # npcdist(), plotting using plot() etc. Entering the name of
##D # the object provides useful summary information, and names() will also
##D # provide useful information.
##D 
##D summary(bw)
##D 
##D # Note - see the example for npudensbw() for multiple illustrations
##D # of how to change the kernel function, kernel order, and so forth.
##D 
##D detach(Italy)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we compute the
##D # cross-validated bandwidths (default) using a second-order Gaussian
##D # kernel (default). Note - this may take a minute or two depending on
##D # the speed of your computer.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D bw <- npcdistbw(xdat=ordered(year), ydat=gdp)
##D 
##D # The object bw can be used for further estimation using npcdist(),
##D # plotting using plot() etc. Entering the name of the object provides
##D # useful summary information, and names() will also provide useful
##D # information.
##D 
##D summary(bw)
##D 
##D # Note - see the example for npudensbw() for multiple illustrations
##D # of how to change the kernel function, kernel order, and so forth.
##D 
##D detach(Italy)
## End(Not run) 



