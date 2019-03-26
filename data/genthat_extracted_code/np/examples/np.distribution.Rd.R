library(np)


### Name: npudist
### Title: Kernel Distribution Estimation with Mixed Data Types
### Aliases: npudist npudist.dbandwidth npudist.call npudist.default
###   npudist.formula
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we load Giovanni
##D # Baiocchi's Italian GDP panel (see Italy for details), then create a
##D # data frame in which year is an ordered factor, GDP is continuous,
##D # compute bandwidths using cross-validation, then create a grid of data
##D # on which the cumulative distribution will be evaluated for plotting
##D # purposes.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # Compute bandwidths using cross-validation (default).
##D 
##D bw <- npudistbw(formula=~ordered(year)+gdp)
##D 
##D # At this stage you could use npudist() to do a variety of things. Here
##D # we compute the npudist() object and place it in Fhat.
##D 
##D Fhat <- npudist(bws=bw)
##D 
##D # Note that simply typing the name of the object returns some useful
##D # information. For more info, one can call summary:
##D 
##D summary(Fhat)
##D 
##D # Next, we illustrate how to create a grid of `evaluation data' and feed
##D # it to the perspective plotting routines in R, among others.
##D 
##D # Create an evaluation data matrix
##D 
##D year.seq <- sort(unique(year))
##D gdp.seq <- seq(1,36,length=50)
##D data.eval <- expand.grid(year=year.seq,gdp=gdp.seq)
##D 
##D # Generate the estimated cumulative distribution computed for the
##D # evaluation data
##D 
##D Fhat <- fitted(npudist(bws=bw, newdata=data.eval))
##D 
##D # Coerce the data into a matrix for plotting with persp()
##D 
##D F <- matrix(Fhat, length(unique(year)), 50)
##D 
##D # Next, create a 3D perspective plot of the CDF F, and a 2D
##D # contour plot.
##D 
##D persp(as.integer(levels(year.seq)), gdp.seq, F, col="lightblue",
##D       ticktype="detailed", ylab="GDP", xlab="Year", zlab="Density",
##D       theta=300, phi=50)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D contour(as.integer(levels(year.seq)), 
##D         gdp.seq, 
##D         F, 
##D         xlab="Year", 
##D         ylab="GDP", 
##D         main = "Cumulative Distribution Contour Plot", 
##D         col=topo.colors(100))
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Alternatively, you could use the plot() command (<ctrl>-C will
##D # interrupt on *NIX systems, <esc> will interrupt on MS Windows
##D # systems).
##D 
##D plot(bw)
##D 
##D detach(Italy)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we load Giovanni
##D # Baiocchi's Italian GDP panel (see Italy for details), then create a
##D # data frame in which year is an ordered factor, GDP is continuous,
##D # compute bandwidths using cross-validation, then create a grid of data
##D # on which the cumulative distribution will be evaluated for plotting
##D # purposes.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D data <- data.frame(year=ordered(year), gdp)
##D 
##D # Compute bandwidths using cross-validation (default).
##D 
##D bw <- npudistbw(dat=data)
##D 
##D # At this stage you could use npudist() to do a variety of
##D # things. Here we compute the npudist() object and place it in Fhat.
##D 
##D Fhat <- npudist(bws=bw)
##D 
##D # Note that simply typing the name of the object returns some useful
##D # information. For more info, one can call summary:
##D 
##D summary(Fhat)
##D 
##D # Next, we illustrate how to create a grid of `evaluation data' and feed
##D # it to the perspective plotting routines in R, among others.
##D 
##D # Create an evaluation data matrix
##D 
##D year.seq <- sort(unique(year))
##D gdp.seq <- seq(1,36,length=50)
##D data.eval <- expand.grid(year=year.seq,gdp=gdp.seq)
##D 
##D # Generate the estimated cumulative distribution computed for the
##D # evaluation data
##D 
##D Fhat <- fitted(npudist(edat = data.eval, bws=bw))
##D 
##D # Coerce the data into a matrix for plotting with persp()
##D 
##D F <- matrix(Fhat, length(unique(year)), 50)
##D 
##D # Next, create a 3D perspective plot of the CDF F, and a 2D
##D # contour plot.
##D 
##D persp(as.integer(levels(year.seq)), gdp.seq, F, col="lightblue",
##D       ticktype="detailed", ylab="GDP", xlab="Year",
##D       zlab="Cumulative Distribution",
##D       theta=300, phi=50)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D contour(as.integer(levels(year.seq)),
##D         gdp.seq, 
##D         F, 
##D         xlab="Year", 
##D         ylab="GDP", 
##D         main = "Cumulative Distribution Contour Plot", 
##D         col=topo.colors(100))
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Alternatively, you could use the plot() command (<ctrl>-C will
##D # interrupt on *NIX systems, <esc> will interrupt on MS Windows
##D # systems).
##D 
##D plot(bw)
##D 
##D detach(Italy)
##D 
##D # EXAMPLE 2 (INTERFACE=FORMULA): For this example, we load the old
##D # faithful geyser data and compute the cumulative distribution function.
##D 
##D library("datasets")
##D data("faithful")
##D attach(faithful)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D bw <- npudistbw(formula=~eruptions+waiting)
##D 
##D summary(bw)
##D 
##D # Plot the cumulative distribution function (<ctrl>-C will interrupt on
##D # *NIX systems, <esc> will interrupt on MS Windows systems). Note that
##D # we use xtrim = -0.2 to extend the plot outside the support of the data
##D # (i.e., extend the tails of the estimate to meet the horizontal axis).
##D 
##D plot(bw, xtrim=-0.2)
##D 
##D detach(faithful)
##D 
##D # EXAMPLE 2 (INTERFACE=DATA FRAME): For this example, we load the old
##D # faithful geyser data and compute the cumulative distribution function.
##D 
##D library("datasets")
##D data("faithful")
##D attach(faithful)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D bw <- npudistbw(dat=faithful)
##D 
##D summary(bw)
##D 
##D # Plot the cumulative distribution function (<ctrl>-C will interrupt on
##D # *NIX systems, <esc> will interrupt on MS Windows systems). Note that
##D # we use xtrim = -0.2 to extend the plot outside the support of the data
##D # (i.e., extend the tails of the estimate to meet the horizontal axis).
##D 
##D plot(bw, xtrim=-0.2)
##D 
##D detach(faithful)
## End(Not run) 



