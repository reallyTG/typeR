library(np)


### Name: npcdens
### Title: Kernel Conditional Density Estimation with Mixed Data Types
### Aliases: npcdens npcdens.call npcdens.conbandwidth npcdens.default
###   npcdens.formula
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we load Giovanni
##D # Baiocchi's Italian GDP panel (see Italy for details), and compute the
##D # likelihood cross-validated bandwidths (default) using a second-order
##D # Gaussian kernel (default). Note - this may take a minute or two
##D # depending on the speed of your computer.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # First, compute the bandwidths... note that this may take a minute or
##D # two depending on the speed of your computer. 
##D 
##D bw <- npcdensbw(formula=gdp~ordered(year))
##D 
##D # Next, compute the condensity object...
##D 
##D fhat <- npcdens(bws=bw)
##D 
##D # The object fhat now contains results such as the estimated conditional
##D # density function (fhat$condens) and so on...
##D 
##D summary(fhat)
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
##D # likelihood cross-validated bandwidths (default) using a second-order
##D # Gaussian kernel (default). Note - this may take a minute or two
##D # depending on the speed of your computer.
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # First, compute the bandwidths... note that this may take a minute or
##D # two depending on the speed of your computer. 
##D 
##D # Note - we cast `X' and `y' as data frames so that plot() can
##D # automatically grab names (this looks like overkill, but in
##D # multivariate settings you would do this anyway, so may as well get in
##D # the habit).
##D 
##D X <- data.frame(year=ordered(year))
##D y <- data.frame(gdp)
##D 
##D bw <- npcdensbw(xdat=X, ydat=y)
##D 
##D # Next, compute the condensity object...
##D 
##D fhat <- npcdens(bws=bw)
##D 
##D # The object fhat now contains results such as the estimated conditional
##D # density function (fhat$condens) and so on...
##D 
##D summary(fhat)
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
##D # conditional density function.
##D 
##D library("datasets")
##D data("faithful")
##D attach(faithful)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer...
##D 
##D bw <- npcdensbw(formula=eruptions~waiting)
##D 
##D summary(bw)
##D 
##D # Plot the density function (<ctrl>-C will interrupt on *NIX systems,
##D # <esc> will interrupt on MS Windows systems).
##D 
##D plot(bw)
##D 
##D detach(faithful)
##D 
##D # EXAMPLE 2 (INTERFACE=DATA FRAME): For this example, we load the old
##D # faithful geyser data from the R `datasets' library and compute the
##D # conditional density function.
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
##D bw <- npcdensbw(xdat=X, ydat=y)
##D 
##D summary(bw)
##D 
##D # Plot the density function (<ctrl>-C will interrupt on *NIX systems, 
##D # <esc> will interrupt on MS Windows systems)
##D 
##D plot(bw)
##D 
##D detach(faithful)
##D 
##D # EXAMPLE 3 (INTERFACE=FORMULA): Replicate the DGP of Klein & Spady
##D # (1993) (see their description on page 405, pay careful attention to
##D # footnote 6 on page 405).
##D 
##D set.seed(123)
##D 
##D n <- 1000
##D 
##D # x1 is chi-squared having 3 df truncated at 6 standardized by
##D # subtracting 2.348 and dividing by 1.511
##D 
##D x <- rchisq(n, df=3)
##D x1 <- (ifelse(x < 6, x, 6) - 2.348)/1.511
##D 
##D # x2 is normal (0, 1) truncated at +- 2 divided by 0.8796
##D 
##D x <- rnorm(n)
##D x2 <- ifelse(abs(x) < 2 , x, 2) / 0.8796
##D 
##D # y is 1 if y* > 0, 0 otherwise.
##D 
##D y <- ifelse(x1 + x2 + rnorm(n) > 0, 1, 0)
##D 
##D # Generate data-driven bandwidths (likelihood cross-validation). Note -
##D # this may take a few minutes depending on the speed of your computer...
##D 
##D bw <- npcdensbw(formula=factor(y)~x1+x2)
##D 
##D # Next, create the evaluation data in order to generate a perspective
##D # plot
##D 
##D x1.seq <- seq(min(x1), max(x1), length=50)
##D x2.seq <- seq(min(x2), max(x2), length=50)
##D X.eval <- expand.grid(x1=x1.seq,x2=x2.seq)
##D 
##D data.eval <- data.frame(y=factor(rep(1, nrow(X.eval))),x1=X.eval[,1],x2=X.eval[,2])
##D 
##D # Now evaluate the conditional probability for y=1 and for the
##D # evaluation Xs
##D 
##D fit <- fitted(npcdens(bws=bw,newdata=data.eval))
##D 
##D # Finally, coerce the data into a matrix for plotting with persp()
##D 
##D fit.mat <- matrix(fit, 50, 50)
##D 
##D # Generate a perspective plot similar to Figure 2 b of Klein and Spady
##D # (1993)
##D 
##D persp(x1.seq, 
##D       x2.seq, 
##D       fit.mat, 
##D       col="white", 
##D       ticktype="detailed", 
##D       expand=0.5, 
##D       axes=FALSE, 
##D       box=FALSE, 
##D       main="Estimated Nonparametric Probability Perspective", 
##D       theta=310, 
##D       phi=25)
##D 
##D # EXAMPLE 3 (INTERFACE=DATA FRAME): Replicate the DGP of Klein & Spady
##D # (1993) (see their description on page 405, pay careful attention to
##D # footnote 6 on page 405).
##D 
##D set.seed(123)
##D 
##D n <- 1000
##D 
##D # x1 is chi-squared having 3 df truncated at 6 standardized by
##D # subtracting 2.348 and dividing by 1.511
##D 
##D x <- rchisq(n, df=3)
##D x1 <- (ifelse(x < 6, x, 6) - 2.348)/1.511
##D 
##D # x2 is normal (0, 1) truncated at +- 2 divided by 0.8796
##D 
##D x <- rnorm(n)
##D x2 <- ifelse(abs(x) < 2 , x, 2) / 0.8796
##D 
##D # y is 1 if y* > 0, 0 otherwise.
##D 
##D y <- ifelse(x1 + x2 + rnorm(n) > 0, 1, 0)
##D 
##D # Create the X matrix
##D 
##D X <- cbind(x1, x2)
##D 
##D # Generate data-driven bandwidths (likelihood cross-validation). Note -
##D # this may take a few minutes depending on the speed of your computer...
##D 
##D bw <- npcdensbw(xdat=X, ydat=factor(y))
##D 
##D # Next, create the evaluation data in order to generate a perspective
##D # plot
##D 
##D x1.seq <- seq(min(x1), max(x1), length=50)
##D x2.seq <- seq(min(x2), max(x2), length=50)
##D X.eval <- expand.grid(x1=x1.seq,x2=x2.seq)
##D 
##D # Now evaluate the conditional probability for y=1 and for the
##D # evaluation Xs
##D 
##D fit <- fitted(npcdens(exdat=X.eval, 
##D                eydat=factor(rep(1, nrow(X.eval))), 
##D                bws=bw))
##D 
##D # Finally, coerce the data into a matrix for plotting with persp()
##D 
##D fit.mat <- matrix(fit, 50, 50)
##D 
##D # Generate a perspective plot similar to Figure 2 b of Klein and Spady
##D # (1993)
##D 
##D persp(x1.seq, 
##D       x2.seq, 
##D       fit.mat, 
##D       col="white", 
##D       ticktype="detailed", 
##D       expand=0.5, 
##D       axes=FALSE, 
##D       box=FALSE, 
##D       main="Estimated Nonparametric Probability Perspective", 
##D       theta=310, 
##D       phi=25)
## End(Not run) 



