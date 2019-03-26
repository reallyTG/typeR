library(np)


### Name: npcdensbw
### Title: Kernel Conditional Density Bandwidth Selection with Mixed Data
###   Types
### Aliases: npcdensbw npcdensbw.NULL npcdensbw.conbandwidth
###   npcdensbw.default npcdensbw.formula
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we compute the
##D # likelihood cross-validated bandwidths (default) using a second-order
##D # Gaussian kernel (default). Note - this may take a minute or two
##D # depending on the speed of your computer.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D bw <- npcdensbw(formula=gdp~ordered(year))
##D 
##D # The object bw can be used for further estimation using
##D # npcdens(), plotting using plot() etc. Entering the name of
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
##D # likelihood cross-validated bandwidths (default) using a second-order
##D # Gaussian kernel (default). Note - this may take a minute or two
##D # depending on the speed of your computer.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D bw <- npcdensbw(xdat=ordered(year), ydat=gdp)
##D 
##D # The object bw can be used for further estimation using
##D # npcdens(), plotting using plot() etc. Entering the name of
##D # the object provides useful summary information, and names() will also
##D # provide useful information.
##D 
##D summary(bw)
##D 
##D # Note - see the example for npudensbw() for multiple illustrations
##D # of how to change the kernel function, kernel order, and so forth.
##D 
##D detach(Italy)
## End(Not run) 



