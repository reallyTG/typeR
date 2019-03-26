library(np)


### Name: npreg
### Title: Kernel Regression with Mixed Data Types
### Aliases: npreg npreg.call npreg.default npreg.formula npreg.rbandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we compute a
##D # bivariate nonparametric regression estimate for Giovanni Baiocchi's
##D # Italian income panel (see Italy for details)
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # First, compute the least-squares cross-validated bandwidths for the
##D # local constant estimator (default).
##D 
##D bw <- npregbw(formula=gdp~ordered(year))
##D 
##D # Now take these bandwidths and fit the model and gradients
##D 
##D model <- npreg(bws = bw, gradients = TRUE)
##D 
##D summary(model)
##D 
##D # Use plot() to visualize the regression function, add bootstrap
##D # error bars, and overlay the data on the same plot.
##D 
##D # Note - this may take a minute or two depending on the speed of your
##D # computer due to bootstrapping being conducted (<ctrl>-C will
##D # interrupt). Note - nothing will appear in the graphics window until
##D # all computations are completed (if you use
##D # plot.errors.method="asymptotic" the figure will instantly appear).
##D 
##D plot(bw, plot.errors.method="bootstrap")
##D points(ordered(year), gdp, cex=.2, col="red")
##D 
##D detach(Italy)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we compute a
##D # bivariate nonparametric regression estimate for Giovanni Baiocchi's
##D # Italian income panel (see Italy for details)
##D 
##D data("Italy")
##D attach(Italy)
##D 
##D # First, compute the least-squares cross-validated bandwidths for the
##D # local constant estimator (default).
##D 
##D bw <- npregbw(xdat=ordered(year), ydat=gdp)
##D 
##D # Now take these bandwidths and fit the model and gradients
##D 
##D model <- npreg(bws = bw, gradients = TRUE)
##D 
##D summary(model)
##D 
##D # Use plot() to visualize the regression function, add bootstrap
##D # error bars, and overlay the data on the same plot.
##D 
##D # Note - this may take a minute or two depending on the speed of your
##D # computer due to bootstrapping being conducted (<ctrl>-C will
##D # interrupt). Note - nothing will appear in the graphics window until
##D # all computations are completed (if you use
##D # plot.errors.method="asymptotic" the figure will instantly appear).
##D 
##D plot(bw, plot.errors.method="bootstrap")
##D points(ordered(year), gdp, cex=.2, col="red")
##D 
##D detach(Italy)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 2 (INTERFACE=FORMULA): For this example, we compute a local
##D # linear fit using the AIC_c bandwidth selection criterion. We then plot
##D # the estimator and its gradient using asymptotic standard errors.
##D 
##D data("cps71")
##D attach(cps71)
##D 
##D bw <- npregbw(logwage~age, regtype="ll", bwmethod="cv.aic")
##D 
##D # Next, plot the regression function...
##D 
##D plot(bw, plot.errors.method="asymptotic")
##D points(age, logwage, cex=.2, col="red")
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, plot the derivative...
##D 
##D plot(bw, plot.errors.method="asymptotic", gradient=TRUE)
##D 
##D detach(cps71)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 2 (INTERFACE=DATA FRAME): For this example, we compute a local
##D # linear fit using the AIC_c bandwidth selection criterion. We then plot
##D # the estimator and its gradient using asymptotic standard errors.
##D 
##D data("cps71")
##D attach(cps71)
##D 
##D bw <- npregbw(xdat=age, ydat=logwage, regtype="ll", bwmethod="cv.aic")
##D 
##D # Next, plot the regression function...
##D 
##D plot(bw, plot.errors.method="asymptotic")
##D points(age, logwage, cex=.2, col="red")
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Next, plot the derivative...
##D 
##D plot(bw, plot.errors.method="asymptotic", gradient=TRUE)
##D 
##D detach(cps71)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 3 (INTERFACE=FORMULA): For this example, we replicate the
##D # nonparametric regression in Maasoumi, Racine, and Stengos
##D # (2007) (see oecdpanel for details). Note that X is multivariate
##D # containing a mix of unordered, ordered, and continuous data types. Note
##D # - this may take a few minutes depending on the speed of your computer.
##D 
##D data("oecdpanel")
##D attach(oecdpanel)
##D 
##D bw <- npregbw(formula=growth~
##D               factor(oecd)+
##D               factor(year)+
##D               initgdp+
##D               popgro+
##D               inv+
##D               humancap)
##D 
##D plot(bw, plot.errors.method="asymptotic")
##D 
##D detach(oecdpanel)
##D 
##D # EXAMPLE 3 (INTERFACE=DATA FRAME): For this example, we replicate the
##D # nonparametric regression in Maasoumi, Racine, and Stengos
##D # (2007) (see oecdpanel for details). Note that X is multivariate
##D # containing a mix of unordered, ordered, and continuous data types. Note
##D # - this may take a few minutes depending on the speed of your computer.
##D 
##D data("oecdpanel")
##D attach(oecdpanel)
##D 
##D y <- growth
##D X <- data.frame(factor(oecd), factor(year), initgdp, popgro, inv, humancap)
##D 
##D bw <- npregbw(xdat=X, ydat=y)
##D 
##D plot(bw, plot.errors.method="asymptotic")
##D 
##D detach(oecdpanel)
##D 
##D 
##D # EXAMPLE 4 (INTERFACE=FORMULA): Experimental data - the effect of
##D # vitamin C on tooth growth in guinea pigs
##D #
##D # Description:
##D #
##D #     The response is the length of odontoblasts (teeth) in each of 10
##D #     guinea pigs at each of three dose levels of Vitamin C (0.5, 1, and
##D #     2 mg) with each of two delivery methods (orange juice or ascorbic
##D #     acid).
##D #
##D # Usage:
##D #
##D #     ToothGrowth
##D #
##D # Format:
##D #
##D #     A data frame with 60 observations on 3 variables.
##D #
##D #       [,1]  len   numeric  Tooth length
##D #       [,2]  supp  factor   Supplement type (VC or OJ).
##D #       [,3]  dose  numeric  Dose in milligrams.
##D 
##D library("datasets")
##D attach(ToothGrowth)
##D 
##D # Note - in this example, there are six cells. 
##D 
##D bw <- npregbw(formula=len~factor(supp)+ordered(dose))
##D 
##D # Now plot the partial regression surfaces with bootstrapped
##D # nonparametric confidence bounds
##D 
##D plot(bw, plot.errors.method="bootstrap", plot.errors.type="quantile")
##D 
##D detach(ToothGrowth)
##D 
##D # EXAMPLE 4 (INTERFACE=DATA FRAME): Experimental data - the effect of
##D # vitamin C on tooth growth in guinea pigs
##D #
##D # Description:
##D #
##D #     The response is the length of odontoblasts (teeth) in each of 10
##D #     guinea pigs at each of three dose levels of Vitamin C (0.5, 1, and
##D #     2 mg) with each of two delivery methods (orange juice or ascorbic
##D #     acid).
##D #
##D # Usage:
##D #
##D #     ToothGrowth
##D #
##D # Format:
##D #
##D #     A data frame with 60 observations on 3 variables.
##D #
##D #       [,1]  len   numeric  Tooth length
##D #       [,2]  supp  factor   Supplement type (VC or OJ).
##D #       [,3]  dose  numeric  Dose in milligrams.
##D 
##D library("datasets")
##D attach(ToothGrowth)
##D 
##D # Note - in this example, there are six cells. 
##D 
##D y <- len
##D X <- data.frame(supp=factor(supp), dose=ordered(dose))
##D 
##D bw <- npregbw(X, y)
##D 
##D # Now plot the partial regression surfaces with bootstrapped
##D # nonparametric confidence bounds
##D 
##D plot(bw, plot.errors.method="bootstrap", plot.errors.type="quantile")
##D 
##D detach(ToothGrowth)
##D 
##D # EXAMPLE 5 (INTERFACE=FORMULA): a pretty 2-d smoothing example adapted
##D # from the R mgcv library which was written by Simon N. Wood.
##D 
##D set.seed(12345)
##D 
##D # This function generates a smooth nonlinear DGP
##D 
##D dgp.func <- function(x, z, sx=0.3, sz=0.4)
##D   { (pi**sx*sz)*(1.2*exp(-(x-0.2)^2/sx^2-(z-0.3)^2/sz^2)+
##D                  0.8*exp(-(x-0.7)^2/sx^2-(z-0.8)^2/sz^2))
##D   }
##D 
##D # Generate 500 observations, compute the true DGP (i.e., no noise), 
##D # then a noisy sample
##D 
##D n <- 500
##D 
##D x <- runif(n)
##D z <- runif(n)
##D 
##D xs <- seq(0, 1, length=30)
##D zs <- seq(0, 1, length=30)
##D 
##D X.eval <- data.frame(x=rep(xs, 30), z=rep(zs, rep(30, 30)))
##D 
##D dgp <- matrix(dgp.func(X.eval$x, X.eval$z), 30, 30)
##D 
##D y <- dgp.func(x, z)+rnorm(n)*0.1
##D 
##D # Prepare the screen for output... first, plot the true DGP
##D 
##D split.screen(c(2, 1))
##D 
##D screen(1)
##D 
##D persp(xs, zs, dgp, xlab="x1", ylab="x2", zlab="y", main="True DGP")
##D 
##D # Next, compute a local linear fit and plot that
##D 
##D bw <- npregbw(formula=y~x+z, regtype="ll", bwmethod="cv.aic")
##D fit <- fitted(npreg(bws=bw, newdata=X.eval))
##D fit.mat <- matrix(fit, 30, 30)
##D 
##D screen(2)
##D 
##D persp(xs, zs, fit.mat, xlab="x1", ylab="x2", zlab="y",
##D       main="Local linear estimate")
##D 
##D # EXAMPLE 5 (INTERFACE=DATA FRAME): a pretty 2-d smoothing example
##D # adapted from the R mgcv library which was written by Simon N. Wood.
##D 
##D set.seed(12345)
##D 
##D # This function generates a smooth nonlinear DGP
##D 
##D dgp.func <- function(x, z, sx=0.3, sz=0.4)
##D   { (pi**sx*sz)*(1.2*exp(-(x-0.2)^2/sx^2-(z-0.3)^2/sz^2)+
##D                  0.8*exp(-(x-0.7)^2/sx^2-(z-0.8)^2/sz^2))
##D   }
##D 
##D # Generate 500 observations, compute the true DGP (i.e., no noise), 
##D # then a noisy sample
##D 
##D n <- 500
##D 
##D x <- runif(n)
##D z <- runif(n)
##D 
##D xs <- seq(0, 1, length=30)
##D zs <- seq(0, 1, length=30)
##D 
##D X <- data.frame(x, z)
##D X.eval <- data.frame(x=rep(xs, 30), z=rep(zs, rep(30, 30)))
##D 
##D dgp <- matrix(dgp.func(X.eval$x, X.eval$z), 30, 30)
##D 
##D y <- dgp.func(x, z)+rnorm(n)*0.1
##D 
##D # Prepare the screen for output... first, plot the true DGP
##D 
##D split.screen(c(2, 1))
##D 
##D screen(1)
##D 
##D persp(xs, zs, dgp, xlab="x1", ylab="x2", zlab="y", main="True DGP")
##D 
##D # Next, compute a local linear fit and plot that
##D 
##D bw <- npregbw(xdat=X, ydat=y, regtype="ll", bwmethod="cv.aic")
##D fit <- fitted(npreg(exdat=X.eval, bws=bw))
##D fit.mat <- matrix(fit, 30, 30)
##D 
##D screen(2)
##D 
##D persp(xs, zs, fit.mat, xlab="x1", ylab="x2", zlab="y",
##D       main="Local linear estimate")
## End(Not run) 



