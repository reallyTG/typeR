library(np)


### Name: npcdist
### Title: Kernel Conditional Distribution Estimation with Mixed Data Types
### Aliases: npcdist npcdist.call npcdist.condbandwidth npcdist.default
###   npcdist.formula
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we load Giovanni
##D # Baiocchi's Italian GDP panel (see Italy for details), and compute the
##D # cross-validated bandwidths (default) using a second-order Gaussian
##D # kernel (default). Note - this may take a minute or two depending on
##D # the speed of your computer.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # First, compute the bandwidths.
##D 
##D bw <- npcdistbw(formula=gdp~ordered(year))
##D 
##D # Next, compute the condistribution object...
##D 
##D Fhat <- npcdist(bws=bw)
##D 
##D # The object Fhat now contains results such as the estimated cumulative
##D # conditional distribution function (Fhat$condist) and so on...
##D 
##D summary(Fhat)
##D 
##D # Call the plot() function to visualize the results (<ctrl>-C will
##D # interrupt on *NIX systems, <esc> will interrupt on MS Windows
##D # systems).
##D 
##D plot(bw)
##D 
##D detach(Italy)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we load Giovanni
##D # Baiocchi's Italian GDP panel (see Italy for details), and compute the
##D # cross-validated bandwidths (default) using a second-order Gaussian
##D # kernel (default). Note - this may take a minute or two depending on
##D # the speed of your computer.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # First, compute the bandwidths.
##D 
##D # Note - we cast `X' and `y' as data frames so that plot() can
##D # automatically grab names (this looks like overkill, but in
##D # multivariate settings you would do this anyway, so may as well get in
##D # the habit).
##D 
##D X <- data.frame(year=ordered(year))
##D y <- data.frame(gdp)
##D 
##D bw <- npcdistbw(xdat=X, ydat=y)
##D 
##D # Next, compute the condistribution object...
##D 
##D Fhat <- npcdist(bws=bw)
##D 
##D # The object Fhat now contains results such as the estimated cumulative
##D # conditional distribution function (Fhat$condist) and so on...
##D 
##D summary(Fhat)
##D 
##D # Call the plot() function to visualize the results (<ctrl>-C will
##D # interrupt on *NIX systems, <esc> will interrupt on MS Windows systems).
##D 
##D plot(bw)
##D 
##D detach(Italy)
##D 
##D # EXAMPLE 2 (INTERFACE=FORMULA): For this example, we load the old
##D # faithful geyser data from the R `datasets' library and compute the
##D # conditional distribution function.
##D 
##D library("datasets")
##D data("faithful")
##D attach(faithful)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D bw <- npcdistbw(formula=eruptions~waiting)
##D 
##D summary(bw)
##D 
##D # Plot the conditional cumulative distribution function (<ctrl>-C will
##D # interrupt on *NIX systems, <esc> will interrupt on MS Windows
##D # systems).
##D 
##D plot(bw)
##D 
##D detach(faithful)
##D 
##D # EXAMPLE 2 (INTERFACE=DATA FRAME): For this example, we load the old
##D # faithful geyser data from the R `datasets' library and compute the
##D # cumulative conditional distribution function.
##D 
##D library("datasets")
##D data("faithful")
##D attach(faithful)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D # Note - we cast `X' and `y' as data frames so that plot() can
##D # automatically grab names (this looks like overkill, but in
##D # multivariate settings you would do this anyway, so may as well get in
##D # the habit).
##D 
##D X <- data.frame(waiting)
##D y <- data.frame(eruptions)
##D 
##D bw <- npcdistbw(xdat=X, ydat=y)
##D 
##D summary(bw)
##D 
##D # Plot the conditional cumulative distribution function (<ctrl>-C will
##D # interrupt on *NIX systems, <esc> will interrupt on MS Windows systems)
##D 
##D plot(bw)
##D 
##D detach(faithful)
##D 
## End(Not run) 



