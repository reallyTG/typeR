library(np)


### Name: npregbw
### Title: Kernel Regression Bandwidth Selection with Mixed Data Types
### Aliases: npregbw npregbw.NULL npregbw.default npregbw.formula
###   npregbw.rbandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we compute a
##D # Bivariate nonparametric regression estimate for Giovanni Baiocchi's
##D # Italian income panel (see Italy for details)
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # Compute the least-squares cross-validated bandwidths for the local
##D # constant estimator (default)
##D 
##D bw <- npregbw(formula=gdp~ordered(year))
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Supply your own bandwidth...
##D 
##D bw <- npregbw(formula=gdp~ordered(year), bws=c(0.75),
##D               bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Treat year as continuous and supply your own scaling factor c in
##D # c sigma n^{-1/(2p+q)}
##D 
##D bw <- npregbw(formula=gdp~year, bws=c(1.06),
##D               bandwidth.compute=FALSE, 
##D               bwscaling=TRUE)
##D 
##D summary(bw)
##D 
##D # Note - see also the example for npudensbw() for more extensive
##D # multiple illustrations of how to change the kernel function, kernel
##D # order, bandwidth type and so forth.
##D 
##D detach(Italy)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we compute a
##D # Bivariate nonparametric regression estimate for Giovanni Baiocchi's
##D # Italian income panel (see Italy for details)
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # Compute the least-squares cross-validated bandwidths for the local
##D # constant estimator (default)
##D 
##D bw <- npregbw(xdat=ordered(year), ydat=gdp)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Supply your own bandwidth...
##D 
##D bw <- npregbw(xdat=ordered(year), ydat=gdp, bws=c(0.75),
##D               bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Treat year as continuous and supply your own scaling factor c in
##D # c sigma n^{-1/(2p+q)}
##D 
##D bw <- npregbw(xdat=year, ydat=gdp, bws=c(1.06),
##D               bandwidth.compute=FALSE, 
##D               bwscaling=TRUE)
##D 
##D summary(bw)
##D 
##D # Note - see also the example for npudensbw() for more extensive
##D # multiple illustrations of how to change the kernel function, kernel
##D # order, bandwidth type and so forth.
##D 
##D detach(Italy)
## End(Not run) 



