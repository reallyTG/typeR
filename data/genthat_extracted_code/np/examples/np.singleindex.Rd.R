library(np)


### Name: npindex
### Title: Semiparametric Single Index Model
### Aliases: npindex npindex.call npindex.default npindex.formula
###   npindex.sibandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): Generate a simple linear model then
##D # estimate it using a semiparametric single index specification and
##D # Ichimura's nonlinear least squares coefficients and bandwidth
##D # (default). Also compute the matrix of gradients and average derivative
##D # estimates.
##D 
##D set.seed(12345)
##D 
##D n <- 100
##D 
##D x1 <- runif(n, min=-1, max=1)
##D x2 <- runif(n, min=-1, max=1)
##D 
##D y <- x1 - x2 + rnorm(n)
##D 
##D # Note - this may take a minute or two depending on the speed of your
##D # computer. Note also that the first element of the vector beta is
##D # normalized to one for identification purposes, and that X must contain
##D # at least one continuous variable.
##D 
##D bw <- npindexbw(formula=y~x1+x2)
##D 
##D summary(bw)
##D 
##D model <- npindex(bws=bw, gradients=TRUE)
##D 
##D summary(model)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Or you can visualize the input with plot.
##D 
##D plot(bw)
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): Generate a simple linear model then
##D # estimate it using a semiparametric single index specification and
##D # Ichimura's nonlinear least squares coefficients and bandwidth
##D # (default). Also compute the matrix of gradients and average derivative
##D # estimates.
##D 
##D set.seed(12345)
##D 
##D n <- 100
##D 
##D x1 <- runif(n, min=-1, max=1)
##D x2 <- runif(n, min=-1, max=1)
##D 
##D y <- x1 - x2 + rnorm(n)
##D 
##D X <- cbind(x1, x2)
##D 
##D # Note - this may take a minute or two depending on the speed of your
##D # computer. Note also that the first element of the vector beta is
##D # normalized to one for identification purposes, and that X must contain
##D # at least one continuous variable.
##D 
##D bw <- npindexbw(xdat=X, ydat=y)
##D 
##D summary(bw)
##D 
##D model <- npindex(bws=bw, gradients=TRUE)
##D 
##D summary(model)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Or you can visualize the input with plot.
##D 
##D plot(bw)
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 2 (INTERFACE=FORMULA): Generate a simple binary outcome linear
##D # model then estimate it using a semiparametric single index
##D # specification and Klein and Spady's likelihood-based coefficients and
##D # bandwidth (default). Also compute the matrix of gradients and average
##D # derivative estimates.
##D 
##D n <- 100
##D 
##D x1 <- runif(n, min=-1, max=1)
##D x2 <- runif(n, min=-1, max=1)
##D 
##D y <- ifelse(x1 + x2 + rnorm(n) > 0, 1, 0)
##D 
##D # Note that the first element of the vector beta is normalized to one
##D # for identification purposes, and that X must contain at least one
##D # continuous variable.
##D 
##D bw <- npindexbw(formula=y~x1+x2, method="kleinspady")
##D 
##D summary(bw)
##D 
##D model <- npindex(bws=bw, gradients=TRUE)
##D 
##D # Note that, since the outcome is binary, we can assess model
##D # performance using methods appropriate for binary outcomes. We look at
##D # the confusion matrix, various classification ratios, and McFadden et
##D # al's measure of predictive performance.
##D 
##D summary(model)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 2 (INTERFACE=DATA FRAME): Generate a simple binary outcome
##D # linear model then estimate it using a semiparametric single index
##D # specification and Klein and Spady's likelihood-based coefficients and
##D # bandwidth (default). Also compute the matrix of gradients and average
##D # derivative estimates.
##D 
##D n <- 100
##D 
##D x1 <- runif(n, min=-1, max=1)
##D x2 <- runif(n, min=-1, max=1)
##D 
##D y <- ifelse(x1 + x2 + rnorm(n) > 0, 1, 0)
##D 
##D X <- cbind(x1, x2)
##D 
##D # Note that the first element of the vector beta is normalized to one
##D # for identification purposes, and that X must contain at least one
##D # continuous variable.
##D 
##D bw <- npindexbw(xdat=X, ydat=y, method="kleinspady")
##D 
##D summary(bw)
##D 
##D model <- npindex(bws=bw, gradients=TRUE)
##D 
##D # Note that, since the outcome is binary, we can assess model
##D # performance using methods appropriate for binary outcomes. We look at
##D # the confusion matrix, various classification ratios, and McFadden et
##D # al's measure of predictive performance.
##D 
##D summary(model)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
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
##D # Compute the parameter vector and bandwidth. Note that the first
##D # element of the vector beta is normalized to one for identification
##D # purposes, and that X must contain at least one continuous variable.
##D 
##D 
##D bw <- npindexbw(formula=y~x1+x2, method="kleinspady")
##D 
##D # Next, create the evaluation data in order to generate a perspective
##D # plot
##D 
##D # Create an evaluation data matrix
##D 
##D x1.seq <- seq(min(x1), max(x1), length=50)
##D x2.seq <- seq(min(x2), max(x2), length=50)
##D X.eval <- expand.grid(x1=x1.seq, x2=x2.seq)
##D 
##D # Now evaluate the single index model on the evaluation data
##D 
##D fit <- fitted(npindex(exdat=X.eval, 
##D                eydat=rep(1, nrow(X.eval)), 
##D                bws=bw))
##D 
##D # Finally, coerce the fitted model into a matrix suitable for 3D
##D # plotting via persp()
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
##D       main="Estimated Semiparametric Probability Perspective", 
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
##D # Compute the parameter vector and bandwidth. Note that the first
##D # element of the vector beta is normalized to one for identification
##D # purposes, and that X must contain at least one continuous variable.
##D 
##D 
##D bw <- npindexbw(xdat=X, ydat=y, method="kleinspady")
##D 
##D # Next, create the evaluation data in order to generate a perspective
##D # plot
##D 
##D # Create an evaluation data matrix
##D 
##D x1.seq <- seq(min(x1), max(x1), length=50)
##D x2.seq <- seq(min(x2), max(x2), length=50)
##D X.eval <- expand.grid(x1=x1.seq, x2=x2.seq)
##D 
##D # Now evaluate the single index model on the evaluation data
##D 
##D fit <- fitted(npindex(exdat=X.eval, 
##D                eydat=rep(1, nrow(X.eval)), 
##D                bws=bw))
##D 
##D # Finally, coerce the fitted model into a matrix suitable for 3D
##D # plotting via persp()
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
##D       main="Estimated Semiparametric Probability Perspective", 
##D       theta=310, 
##D       phi=25)
## End(Not run) 



