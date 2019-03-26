library(np)


### Name: npudistbw
### Title: Kernel Distribution Bandwidth Selection with Mixed Data Types
### Aliases: npudistbw npudistbw.formula npudistbw.NULL npudistbw.default
###   npudistbw.dbandwidth
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
##D # We compute bandwidths for the kernel cumulative distribution estimator
##D # using the normal-reference rule-of-thumb. Otherwise, we use the
##D # defaults (second order Gaussian kernel, fixed bandwidths). Note that
##D # the bandwidth object you compute inherits all properties of the
##D # estimator (kernel type, kernel order, estimation method) and can be
##D # fed directly into the plotting utility plot() or into the npudist()
##D # function.
##D 
##D bw <- npudistbw(formula=~ordered(year)+gdp, bwmethod="normal-reference")
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
##D bw <- npudistbw(formula=~ordered(year)+gdp, bws=c(0.5, 1.0),
##D                 bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, if you wanted to use the 1.587 sigma n^{-1/(2p+q)} rule-of-thumb
##D # for the bandwidth for the continuous variable and, say, no smoothing
##D # for the discrete variable, you would use the bwscaling=TRUE argument
##D # and feed in the values 0 for the first variable (year) and 1.587 for
##D # the second (gdp). Note that in the printout it reports the `scale
##D # factors' rather than the `bandwidth' as reported in some of the
##D # previous examples.
##D 
##D bw <- npudistbw(formula=~ordered(year)+gdp, bws=c(0, 1.587),
##D                 bwscaling=TRUE, 
##D                 bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # If you wished to use, say, an eighth-order Epanechnikov kernel for the
##D # continuous variables and specify your own bandwidths, you could do
##D # that as follows.
##D 
##D bw <- npudistbw(formula=~ordered(year)+gdp, bws=c(0.5, 1.0),
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
##D bw <- npudistbw(formula=~ordered(year)+gdp, bwtype = "generalized_nn")
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, compute bandwidths using cross-validation, fixed bandwidths, and
##D # a second-order Gaussian kernel for the continuous variable (default).
##D # Note - this may take a few minutes depending on the speed of your
##D # computer.
##D 
##D bw <- npudistbw(formula=~ordered(year)+gdp)
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
##D bw <- npudistbw(formula=~ordered(year)+gdp, bws=c(1, 1))
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
##D # We compute bandwidths for the kernel cumulative distribution estimator
##D # using the normal-reference rule-of-thumb. Otherwise, we use the
##D # defaults (second-order Gaussian kernel, fixed bandwidths). Note that
##D # the bandwidth object you compute inherits all properties of the
##D # estimator (kernel type, kernel order, estimation method) and can be
##D # fed directly into the plotting utility plot() or into the npudist()
##D # function.
##D 
##D bw <- npudistbw(dat=data, bwmethod="normal-reference")
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
##D bw <- npudistbw(dat=data, bws=c(0.5, 1.0), bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, if you wanted to use the 1.587 sigma n^{-1/(2p+q)} rule-of-thumb
##D # for the bandwidth for the continuous variable and, say, no smoothing
##D # for the discrete variable, you would use the bwscaling=TRUE argument
##D # and feed in the values 0 for the first variable (year) and 1.587 for
##D # the second (gdp). Note that in the printout it reports the `scale
##D # factors' rather than the `bandwidth' as reported in some of the
##D # previous examples.
##D 
##D bw <- npudistbw(dat=data, bws=c(0, 1.587),
##D                 bwscaling=TRUE, 
##D                 bandwidth.compute=FALSE)
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # If you wished to use, say, an eighth-order Epanechnikov kernel for the
##D # continuous variables and specify your own bandwidths, you could do
##D # that as follows:
##D 
##D bw <- npudistbw(dat=data, bws=c(0.5, 1.0),
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
##D bw <- npudistbw(dat=data, bwtype = "generalized_nn")
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, compute bandwidths using cross-validation, fixed bandwidths, and
##D # a second order Gaussian kernel for the continuous variable (default).
##D # Note - this may take a few minutes depending on the speed of your
##D # computer.
##D 
##D bw <- npudistbw(dat=data)
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
##D bw <- npudistbw(dat=data, bws=c(1, 1))
##D 
##D summary(bw)
##D 
##D detach(Italy)
## End(Not run) 



