library(np)


### Name: npksum
### Title: Kernel Sums with Mixed Data Types
### Aliases: npksum npksum.default npksum.formula npksum.numeric
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1: For this example, we generate 100,000 observations from a
##D # N(0, 1) distribution, then evaluate the kernel density on a grid of 50
##D # equally spaced points using the npksum() function, then compare
##D # results with the (identical) npudens() function output
##D 
##D n <- 100000
##D x <- rnorm(n)
##D x.eval <- seq(-4, 4, length=50)
##D 
##D # Compute the bandwidth with the normal-reference rule-of-thumb
##D 
##D bw <- npudensbw(dat=x, bwmethod="normal-reference")
##D 
##D # Compute the univariate kernel density estimate using the 100,000
##D # training data points evaluated on the 50 evaluation data points, 
##D # i.e., 1/nh times the sum of the kernel function evaluated at each of
##D # the 50 points
##D 
##D den.ksum <- npksum(txdat=x, exdat=x.eval, bws=bw$bw)$ksum/(n*bw$bw[1])
##D 
##D # Note that, alternatively (easier perhaps), you could use the
##D # bandwidth.divide=TRUE argument and drop the *bw$bw[1] term in the
##D # denominator, as in
##D # npksum(txdat=x, exdat=x.eval, bws=bw$bw, bandwidth.divide=TRUE)$ksum/n
##D 
##D # Compute the density directly with the npudens() function...
##D 
##D den <- fitted(npudens(tdat=x, edat=x.eval, bws=bw$bw))
##D 
##D # Plot the true DGP, the npksum()/(nh) estimate and (identical)
##D # npudens() estimate
##D 
##D plot(x.eval, dnorm(x.eval), xlab="X", ylab="Density", type="l")
##D points(x.eval, den.ksum, col="blue")
##D points(x.eval, den, col="red", cex=0.2)
##D legend(1, .4, 
##D        c("DGP", "npksum()", 
##D        "npudens()"), 
##D        col=c("black", "blue", "red"), 
##D        lty=c(1, 1, 1))
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 2: For this example, we first obtain residuals from a
##D # parametric regression model, then compute a vector of leave-one-out
##D # kernel weighted sums of squared residuals where the kernel function is
##D # raised to the power 2. Note that this returns a vector of kernel
##D # weighted sums, one for each element of the error vector. Note also
##D # that you can specify the bandwidth type, kernel function, kernel order
##D # etc.
##D 
##D data("cps71")
##D attach(cps71)
##D 
##D error <- residuals(lm(logwage~age+I(age^2)))
##D 
##D bw <- npreg(error~age)
##D 
##D ksum <- npksum(txdat=age, 
##D                tydat=error^2, 
##D                bws=bw$bw,
##D                leave.one.out=TRUE, 
##D                kernel.pow=2)
##D 
##D ksum
##D 
##D # Obviously, if we wanted the sum of these weighted kernel sums then, 
##D # trivially, 
##D 
##D sum(ksum$ksum)
##D 
##D detach(cps71)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Note that weighted leave-one-out sums of squared residuals are used to
##D # construct consistent model specification tests. In fact, the
##D # npcmstest() routine in this package is constructed purely from calls
##D # to npksum(). You can type npcmstest to see the npcmstest()
##D # code and also examine some examples of the many uses of
##D # npksum().
##D 
##D # EXAMPLE 3: For this example, we conduct local-constant (i.e., 
##D # Nadaraya-Watson) kernel regression. We shall use cross-validated
##D # bandwidths using npregbw() by way of example. Note we extract
##D # the kernel sum from npksum() via the `$ksum' argument in both
##D # the numerator and denominator.
##D 
##D data("cps71")
##D attach(cps71)
##D 
##D bw <- npregbw(xdat=age, ydat=logwage)
##D 
##D fit.lc <- npksum(txdat=age, tydat=logwage, bws=bw$bw)$ksum/
##D           npksum(txdat=age, bws=bw$bw)$ksum
##D 
##D plot(age, logwage, xlab="Age", ylab="log(wage)")
##D lines(age, fit.lc)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # If you wished to compute the kernel sum for a set of evaluation points, 
##D # you first generate the set of points then feed this to npksum, 
##D # e.g., for the set (20, 30, ..., 60) we would use
##D 
##D age.seq <- seq(20, 60, 10)
##D 
##D fit.lc <- npksum(txdat=age, exdat=age.seq, tydat=logwage, bws=bw$bw)$ksum/
##D           npksum(txdat=age, exdat=age.seq, bws=bw$bw)$ksum
##D 
##D # Note that now fit.lc contains the 5 values of the local constant
##D # estimator corresponding to age.seq...
##D 
##D fit.lc
##D 
##D detach(cps71)
##D 
##D # EXAMPLE 4: For this example, we conduct least-squares cross-validation
##D # for the local-constant regression estimator. We first write an R
##D # function `ss' that computes the leave-one-out sum of squares using the
##D # npksum() function, and then feed this function, along with
##D # random starting values for the bandwidth vector, to the nlm() routine
##D # in R (nlm = Non-Linear Minimization). Finally, we compare results with
##D # the function npregbw() that is written solely in C and calls
##D # a tightly coupled C-level search routine.  Note that one could make
##D # repeated calls to nlm() using different starting values for h (highly
##D # recommended in general).
##D 
##D # Increase the number of digits printed out by default in R and avoid
##D # using scientific notation for this example (we wish to compare
##D # objective function minima)
##D 
##D options(scipen=100, digits=12)
##D 
##D # Generate 100 observations from a simple DGP where one explanatory
##D # variable is irrelevant.
##D 
##D n <- 100
##D 
##D x1 <- runif(n)
##D x2 <- rnorm(n)
##D x3 <- runif(n)
##D 
##D txdat <- data.frame(x1, x2, x3)
##D 
##D # Note - x3 is irrelevant
##D 
##D tydat <- x1 + sin(x2) + rnorm(n)
##D 
##D # Write an R function that returns the average leave-one-out sum of
##D # squared residuals for the local constant estimator based upon
##D # npksum(). This function accepts one argument and presumes that
##D # txdat and tydat have been defined already.
##D 
##D ss <- function(h) {
##D 
##D # Test for valid (non-negative) bandwidths - return infinite penalty
##D # when this occurs
##D 
##D   if(min(h)<=0) {
##D 
##D     return(.Machine$double.xmax)
##D 
##D   } else {
##D 
##D     mean <-  npksum(txdat, 
##D                     tydat, 
##D                     leave.one.out=TRUE, 
##D                     bandwidth.divide=TRUE, 
##D                     bws=h)$ksum/
##D              npksum(txdat, 
##D                     leave.one.out=TRUE, 
##D                     bandwidth.divide=TRUE, 
##D                     bws=h)$ksum
##D   
##D     return(sum((tydat-mean)^2)/length(tydat))
##D 
##D   }
##D 
##D }
##D 
##D # Now pass this function to R's nlm() routine along with random starting
##D # values and place results in `nlm.return'.
##D 
##D nlm.return <- nlm(ss, runif(length(txdat)))
##D 
##D bw <- npregbw(xdat=txdat, ydat=tydat)
##D 
##D # Bandwidths from nlm()
##D 
##D nlm.return$estimate
##D 
##D # Bandwidths from npregbw()
##D 
##D bw$bw
##D 
##D # Function value (minimum) from nlm()
##D 
##D nlm.return$minimum
##D 
##D # Function value (minimum) from npregbw()
##D 
##D bw$fval
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 5: For this example, we use npksum() to plot the kernel
##D # function itself. Our `training data' is the singleton, 0, and our
##D # evaluation data a grid in [-4,4], while we use a bandwidth of 1. By
##D # way of example we plot a sixth order Gaussian kernel (note that this
##D # kernel function can assume negative values)
##D 
##D x <- 0
##D x.eval <- seq(-4,4,length=500)
##D 
##D kernel <- npksum(txdat=x,exdat=x.eval,bws=1,
##D                  bandwidth.divide=TRUE,
##D                  ckertype="gaussian",
##D                  ckerorder=6)$ksum
##D 
##D plot(x.eval,kernel,type="l",xlab="X",ylab="Kernel Function") 
##D abline(0,0)
## End(Not run) 



