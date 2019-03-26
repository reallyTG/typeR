library(np)


### Name: npplot
### Title: General Purpose Plotting of Nonparametric Objects
### Aliases: npplot npplot.bandwidth npplot.conbandwidth npplot.plbandwidth
###   npplot.rbandwidth npplot.scbandwidth npplot.sibandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1: For this example, we load Giovanni Baiocchi's Italian GDP
##D # panel (see Italy for details), then create a data frame in which year
##D # is an ordered factor, GDP is continuous, compute bandwidths using
##D # likelihood cross-validation, then create a grid of data on which the
##D # density will be evaluated for plotting purposes
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D data <- data.frame(ordered(year), gdp)
##D 
##D # Compute bandwidths using likelihood cross-validation (default). Note
##D # that this may take a minute or two depending on the speed of your
##D # computer...
##D 
##D bw <- npudensbw(dat=data)
##D 
##D # You can always do things manually, as the following example demonstrates
##D 
##D # Create an evaluation data matrix
##D 
##D year.seq <- sort(unique(year))
##D gdp.seq <- seq(1,36,length=50)
##D data.eval <- expand.grid(year=year.seq,gdp=gdp.seq)
##D 
##D # Generate the estimated density computed for the evaluation data
##D 
##D fhat <- fitted(npudens(tdat = data, edat = data.eval, bws=bw))
##D 
##D # Coerce the data into a matrix for plotting with persp()
##D 
##D f <- matrix(fhat, length(unique(year)), 50)
##D 
##D # Next, create a 3D perspective plot of the PDF f
##D 
##D persp(as.integer(levels(year.seq)), gdp.seq, f, col="lightblue",
##D       ticktype="detailed", ylab="GDP", xlab="Year", zlab="Density",
##D       theta=300, phi=50)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # However, npplot simply streamlines this process and aids in the
##D # visualization process (<ctrl>-C will interrupt on *NIX systems, <esc>
##D # will interrupt on MS Windows systems).
##D 
##D plot(bw)
##D 
##D # npplot also streamlines construction of variability bounds (<ctrl>-C
##D # will interrupt on *NIX systems, <esc> will interrupt on MS Windows
##D # systems)
##D 
##D plot(bw, plot.errors.method = "asymptotic")
##D 
##D # EXAMPLE 2: For this example, we simulate multivariate data, and plot the
##D # partial regression surfaces for a locally linear estimator and its
##D # derivatives.
##D 
##D set.seed(123)
##D 
##D n <- 100
##D 
##D x1 <- runif(n)
##D x2 <- runif(n)
##D x3 <- runif(n)
##D x4 <- rbinom(n, 2, .3)
##D 
##D y <- 1 + x1 + x2 + x3 + x4 + rnorm(n)
##D 
##D X <- data.frame(x1, x2, x3, ordered(x4))
##D 
##D bw <- npregbw(xdat=X, ydat=y, regtype="ll", bwmethod="cv.aic")
##D 
##D plot(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Now plot the gradients...
##D 
##D plot(bw, gradients=TRUE)
##D 
##D # Plot the partial regression surfaces with bias-corrected bootstrapped
##D # nonparametric confidence intervals... this may take a minute or two
##D # depending on the speed of your computer as the bootstrapping must be
##D # completed prior to results being displayed...
##D 
##D plot(bw,
##D      plot.errors.method="bootstrap", 
##D      plot.errors.center="bias-corrected",
##D      plot.errors.type="quantiles")
##D 
##D # Note - if you wished to create, say, a postscript graph for inclusion
##D # in, say, a latex document, use R's `postscript' command to switch to
##D # the postscript device (turn off the device once completed). The
##D # following will create a disk file `graph.ps' that can be pulled into,
##D # say, a latex document via \includegraphics[width=5in, height=5in,
##D # angle=270]{graph.ps}
##D 
##D # Note - make sure to include the graphicx package in your latex
##D # document via adding \usepackage{graphicx} in your latex file. Also, 
##D # you might want to use larger fonts, which can be achieved by adding the
##D # pointsize= argument, e.g., postscript(file="graph.ps", pointsize=20)
##D 
##D postscript(file="graph.ps")
##D plot(bw)
##D dev.off()
##D 
##D # The following latex file compiled in the same directory as graph.ps
##D # ought to work (remove the #s and place in a file named, e.g., 
##D # test.tex).
##D # \documentclass[]{article}
##D # \usepackage{graphicx}
##D # \begin{document}
##D # \begin{figure}[!ht]
##D # \includegraphics[width=5in, height=5in, angle=270]{graph.ps}
##D # \caption{Local linear partial regression surfaces.}
##D # \end{figure}
##D # \end{document}
##D 
##D 
##D # EXAMPLE 3: This example demonstrates how to retrieve plotting data from
##D # npplot(). When npplot() is called with the arguments
##D # `plot.behavior="plot-data"' (or "data"), it returns plotting objects
##D # named r1, r2, and so on (rg1, rg2, and so on when `gradients=TRUE' is
##D # set).  Each plotting object's index (1,2,...) corresponds to the index
##D # of the explanatory data data frame xdat (and zdat if appropriate). 
##D 
##D # Take the cps71 data by way of example. In this case, there is only one
##D # object returned by default, `r1', since xdat is univariate.
##D 
##D data("cps71")
##D attach(cps71)
##D 
##D # Compute bandwidths for local linear regression using cv.aic...
##D 
##D bw <- npregbw(xdat=age,ydat=logwage,regtype="ll",bwmethod="cv.aic")
##D 
##D # Generate the plot and return plotting data, and store output in
##D # `plot.out' (NOTE: the call to `plot.behavior' is necessary).
##D 
##D plot.out <- plot(bw,
##D                  perspective=FALSE,
##D                  plot.errors.method="bootstrap",
##D                  plot.errors.boot.num=25,
##D                  plot.behavior="plot-data")
##D 
##D # Now grab the r1 object that npplot plotted on the screen, and take
##D # what you need. First, take the output, lower error bound and upper
##D # error bound...
##D 
##D logwage.eval <- fitted(plot.out$r1)
##D logwage.se <- se(plot.out$r1)
##D logwage.lower.ci <- logwage.eval + logwage.se[,1]
##D logwage.upper.ci <- logwage.eval + logwage.se[,2]
##D 
##D # Next grab the x data evaluation data. xdat is a data.frame(), so we
##D # need to coerce it into a vector (take the `first column' of data frame
##D # even though there is only one column)
##D 
##D age.eval <- plot.out$r1$eval[,1]
##D 
##D # Now we could plot this if we wished, or direct it to whatever end use
##D # we envisioned. We plot the results using R's plot() routines...
##D 
##D plot(age,logwage,cex=0.2,xlab="Age",ylab="log(Wage)")
##D lines(age.eval,logwage.eval)
##D lines(age.eval,logwage.lower.ci,lty=3)
##D lines(age.eval,logwage.upper.ci,lty=3)
##D 
##D # If you wanted npplot() data for gradients, you would use the argument
##D # `gradients=TRUE' in the call to npplot() as the following
##D # demonstrates...
##D 
##D plot.out <- plot(bw,
##D                  perspective=FALSE,
##D                  plot.errors.method="bootstrap",
##D                  plot.errors.boot.num=25,
##D                  plot.behavior="plot-data",
##D                  gradients=TRUE)
##D 
##D # Now grab object that npplot() plotted on the screen. First, take the
##D # output, lower error bound and upper error bound... note that gradients
##D # are stored in objects rg1, rg2 etc.
##D 
##D grad.eval <- gradients(plot.out$rg1)
##D grad.se <- gradients(plot.out$rg1, errors = TRUE)
##D grad.lower.ci <- grad.eval + grad.se[,1]
##D grad.upper.ci <- grad.eval + grad.se[,2]
##D 
##D # Next grab the x evaluation data. xdat is a data.frame(), so we need to
##D # coerce it into a vector (take `first column' of data frame even though
##D # there is only one column)
##D 
##D age.eval <- plot.out$rg1$eval[,1]
##D 
##D # We plot the results using R's plot() routines...
##D 
##D plot(age.eval,grad.eval,cex=0.2,
##D      ylim=c(min(grad.lower.ci),max(grad.upper.ci)),
##D      xlab="Age",ylab="d log(Wage)/d Age",type="l")
##D lines(age.eval,grad.lower.ci,lty=3)
##D lines(age.eval,grad.upper.ci,lty=3)
##D 
##D detach(cps71)
## End(Not run) 



