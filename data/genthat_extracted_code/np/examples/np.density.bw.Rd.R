library(np)


### Name: npudensbw
### Title: Kernel Density Bandwidth Selection with Mixed Data Types
### Aliases: npudensbw npudensbw.formula npudensbw.NULL npudensbw.default
###   npudensbw.bandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we load Giovanni
##D # Baiocchi's Italian GDP panel (see Italy for details), then create a
##D # data frame in which year is an ordered factor, GDP is continuous.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D data <- data.frame(ordered(year), gdp)
##D 
##D # We compute bandwidths for the kernel density estimator using the
##D # normal-reference rule-of-thumb. Otherwise, we use the defaults (second
##D # order Gaussian kernel, fixed bandwidths). Note that the bandwidth
##D # object you compute inherits all properties of the estimator (kernel
##D # type, kernel order, estimation method) and can be fed directly into
##D # the plotting utility plot() or into the npudens() function.
##D 
##D bw <- npudensbw(formula=~ordered(year)+gdp, bwmethod="normal-reference")
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, specify a value for the bandwidths manually (0.5 for the first
##D # variable, 1.0 for the second)...
##D 
##D bw <- npudensbw(formula=~ordered(year)+gdp, bws=c(0.5, 1.0),
##D                 bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, if you wanted to use the 1.06 sigma n^{-1/(2p+q)} rule-of-thumb
##D # for the bandwidth for the continuous variable and, say, no smoothing
##D # for the discrete variable, you would use the bwscaling=TRUE argument
##D # and feed in the values 0 for the first variable (year) and 1.06 for
##D # the second (gdp). Note that in the printout it reports the `scale
##D # factors' rather than the `bandwidth' as reported in some of the
##D # previous examples.
##D 
##D bw <- npudensbw(formula=~ordered(year)+gdp, bws=c(0, 1.06),
##D                 bwscaling=TRUE, 
##D                 bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # If you wished to use, say, an eighth order Epanechnikov kernel for the
##D # continuous variables and specify your own bandwidths, you could do
##D # that as follows.
##D 
##D bw <- npudensbw(formula=~ordered(year)+gdp, bws=c(0.5, 1.0),
##D                 bandwidth.compute=FALSE, 
##D                 ckertype="epanechnikov",
##D                 ckerorder=8)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # If you preferred, say, nearest-neighbor bandwidths and a generalized
##D # kernel estimator for the continuous variable, you would use the
##D # bwtype="generalized_nn" argument.
##D 
##D bw <- npudensbw(formula=~ordered(year)+gdp, bwtype = "generalized_nn")
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, compute bandwidths using likelihood cross-validation, fixed
##D # bandwidths, and a second order Gaussian kernel for the continuous
##D # variable (default).  Note - this may take a few minutes depending on
##D # the speed of your computer.
##D 
##D bw <- npudensbw(formula=~ordered(year)+gdp)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Finally, if you wish to use initial values for numerical search, you
##D # can either provide a vector of bandwidths as in bws=c(...) or a
##D # bandwidth object from a previous run, as in
##D 
##D bw <- npudensbw(formula=~ordered(year)+gdp, bws=c(1, 1))
##D 
##D summary(bw)
##D 
##D detach(Italy)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we load Giovanni
##D # Baiocchi's Italian GDP panel (see Italy for details), then create a
##D # data frame in which year is an ordered factor, GDP is continuous.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D data <- data.frame(ordered(year), gdp)
##D 
##D # We compute bandwidths for the kernel density estimator using the
##D # normal-reference rule-of-thumb. Otherwise, we use the defaults (second
##D # order Gaussian kernel, fixed bandwidths). Note that the bandwidth
##D # object you compute inherits all properties of the estimator (kernel
##D # type, kernel order, estimation method) and can be fed directly into
##D # the plotting utility plot() or into the npudens() function.
##D 
##D bw <- npudensbw(dat=data, bwmethod="normal-reference")
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, specify a value for the bandwidths manually (0.5 for the first
##D # variable, 1.0 for the second)...
##D 
##D bw <- npudensbw(dat=data, bws=c(0.5, 1.0), bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, if you wanted to use the 1.06 sigma n^{-1/(2p+q)} rule-of-thumb
##D # for the bandwidth for the continuous variable and, say, no smoothing
##D # for the discrete variable, you would use the bwscaling=TRUE argument
##D # and feed in the values 0 for the first variable (year) and 1.06 for
##D # the second (gdp). Note that in the printout it reports the `scale
##D # factors' rather than the `bandwidth' as reported in some of the
##D # previous examples.
##D 
##D bw <- npudensbw(dat=data, bws=c(0, 1.06),
##D                 bwscaling=TRUE, 
##D                 bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # If you wished to use, say, an eighth order Epanechnikov kernel for the
##D # continuous variables and specify your own bandwidths, you could do
##D # that as follows:
##D 
##D bw <- npudensbw(dat=data, bws=c(0.5, 1.0),
##D                 bandwidth.compute=FALSE, 
##D                 ckertype="epanechnikov",
##D                 ckerorder=8)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # If you preferred, say, nearest-neighbor bandwidths and a generalized
##D # kernel estimator for the continuous variable, you would use the
##D # bwtype="generalized_nn" argument.
##D 
##D bw <- npudensbw(dat=data, bwtype = "generalized_nn")
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, compute bandwidths using likelihood cross-validation, fixed
##D # bandwidths, and a second order Gaussian kernel for the continuous
##D # variable (default).  Note - this may take a few minutes depending on
##D # the speed of your computer.
##D 
##D bw <- npudensbw(dat=data)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Finally, if you wish to use initial values for numerical search, you
##D # can either provide a vector of bandwidths as in bws=c(...) or a
##D # bandwidth object from a previous run, as in
##D 
##D bw <- npudensbw(dat=data, bws=c(1, 1))
##D 
##D summary(bw)
##D 
##D detach(Italy)
## End(Not run) 



