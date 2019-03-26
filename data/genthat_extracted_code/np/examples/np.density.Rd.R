library(np)


### Name: npudens
### Title: Kernel Density Estimation with Mixed Data Types
### Aliases: npudens npudens.bandwidth npudens.call npudens.default
###   npudens.formula
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we load Giovanni
##D # Baiocchi's Italian GDP panel (see Italy for details), then create a
##D # data frame in which year is an ordered factor, GDP is continuous,
##D # compute bandwidths using likelihood cross-validation, then create a
##D # grid of data on which the density will be evaluated for plotting
##D # purposes.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # Compute bandwidths using likelihood cross-validation (default).
##D 
##D bw <- npudensbw(formula=~ordered(year)+gdp)
##D 
##D # At this stage you could use npudens() to do a variety of
##D # things. Here we compute the npudens() object and place it in fhat.
##D 
##D fhat <- npudens(bws=bw)
##D 
##D # Note that simply typing the name of the object returns some useful
##D # information. For more info, one can call summary: 
##D 
##D summary(fhat)
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
##D # Generate the estimated density computed for the evaluation data
##D 
##D fhat <- fitted(npudens(bws=bw, newdata=data.eval))
##D 
##D # Coerce the data into a matrix for plotting with persp()
##D 
##D f <- matrix(fhat, length(unique(year)), 50)
##D 
##D # Next, create a 3D perspective plot of the PDF f, and a 2D
##D # contour plot.
##D 
##D persp(as.integer(levels(year.seq)), gdp.seq, f, col="lightblue",
##D       ticktype="detailed", ylab="GDP", xlab="Year", zlab="Density",
##D       theta=300, phi=50)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D contour(as.integer(levels(year.seq)), 
##D         gdp.seq, 
##D         f, 
##D         xlab="Year", 
##D         ylab="GDP", 
##D         main = "Density Contour Plot", 
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
##D # compute bandwidths using likelihood cross-validation, then create a
##D # grid of data on which the density will be evaluated for plotting
##D # purposes.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D data <- data.frame(year=ordered(year), gdp)
##D 
##D # Compute bandwidths using likelihood cross-validation (default).
##D 
##D bw <- npudensbw(dat=data)
##D 
##D # At this stage you could use npudens() to do a variety of
##D # things. Here we compute the npudens() object and place it in fhat.
##D 
##D fhat <- npudens(bws=bw)
##D 
##D # Note that simply typing the name of the object returns some useful
##D # information. For more info, one can call summary: 
##D 
##D summary(fhat)
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
##D # Generate the estimated density computed for the evaluation data
##D 
##D fhat <- fitted(npudens(edat = data.eval, bws=bw))
##D 
##D # Coerce the data into a matrix for plotting with persp()
##D 
##D f <- matrix(fhat, length(unique(year)), 50)
##D 
##D # Next, create a 3D perspective plot of the PDF f, and a 2D
##D # contour plot.
##D 
##D persp(as.integer(levels(year.seq)), gdp.seq, f, col="lightblue",
##D       ticktype="detailed", ylab="GDP", xlab="Year", zlab="Density",
##D       theta=300, phi=50)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D contour(as.integer(levels(year.seq)),
##D         gdp.seq, 
##D         f, 
##D         xlab="Year", 
##D         ylab="GDP", 
##D         main = "Density Contour Plot", 
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
##D # faithful geyser data and compute the density and distribution
##D # functions.
##D 
##D library("datasets")
##D data("faithful")
##D attach(faithful)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D bw <- npudensbw(formula=~eruptions+waiting)
##D 
##D summary(bw)
##D 
##D # Plot the density function (<ctrl>-C will interrupt on *NIX systems, 
##D # <esc> will interrupt on MS Windows systems). Note that we use xtrim =
##D # -0.2 to extend the plot outside the support of the data (i.e., extend
##D # the tails of the estimate to meet the horizontal axis).
##D 
##D plot(bw, xtrim=-0.2)
##D 
##D detach(faithful)
##D 
##D # EXAMPLE 2 (INTERFACE=DATA FRAME): For this example, we load the old
##D # faithful geyser data and compute the density and distribution
##D # functions.
##D 
##D library("datasets")
##D data("faithful")
##D attach(faithful)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D bw <- npudensbw(dat=faithful)
##D 
##D summary(bw)
##D 
##D # Plot the density function (<ctrl>-C will interrupt on *NIX systems, 
##D # <esc> will interrupt on MS Windows systems). Note that we use xtrim =
##D # -0.2 to extend the plot outside the support of the data (i.e., extend
##D # the tails of the estimate to meet the horizontal axis).
##D 
##D plot(bw, xtrim=-0.2)
##D 
##D detach(faithful)
## End(Not run) 



