library(np)


### Name: npsigtest
### Title: Kernel Regression Significance Test with Mixed Data Types
### Aliases: npsigtest npsigtest.call npsigtest.default npsigtest.formula
###   npsigtest.rbandwidth npsigtest.npregression
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we simulate 100 draws
##D # from a DGP in which z, the first column of X, is an irrelevant
##D # discrete variable
##D 
##D set.seed(12345)
##D 
##D n <- 100
##D 
##D z <- rbinom(n,1,.5)
##D x1 <- rnorm(n)
##D x2 <- runif(n,-2,2)
##D 
##D y <- x1 + x2 + rnorm(n)
##D 
##D # Next, we must compute bandwidths for our regression model. In this
##D # case we conduct local linear regression. Note - this may take a few
##D # minutes depending on the speed of your computer...
##D 
##D bw <- npregbw(formula=y~factor(z)+x1+x2,regtype="ll",bwmethod="cv.aic")
##D 
##D # We then compute a vector of tests corresponding to the columns of
##D # X. Note - this may take a few minutes depending on the speed of your
##D # computer... we have to generate the null distribution of the statistic
##D # for each variable whose significance is being tested using 399
##D # bootstrap replications for each...
##D 
##D npsigtest(bws=bw)
##D 
##D # If you wished, you could conduct the test for, say, variables 1 and 3
##D # only, as in
##D 
##D npsigtest(bws=bw,index=c(1,3))
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we simulate 100
##D # draws from a DGP in which z, the first column of X, is an irrelevant
##D # discrete variable
##D 
##D set.seed(12345)
##D 
##D n <- 100
##D 
##D z <- rbinom(n,1,.5)
##D x1 <- rnorm(n)
##D x2 <- runif(n,-2,2)
##D 
##D X <- data.frame(factor(z),x1,x2)
##D 
##D y <- x1 + x2 + rnorm(n)
##D 
##D # Next, we must compute bandwidths for our regression model. In this
##D # case we conduct local linear regression. Note - this may take a few
##D # minutes depending on the speed of your computer...
##D 
##D bw <- npregbw(xdat=X,ydat=y,regtype="ll",bwmethod="cv.aic")
##D 
##D # We then compute a vector of tests corresponding to the columns of
##D # X. Note - this may take a few minutes depending on the speed of your
##D # computer... we have to generate the null distribution of the statistic
##D # for each variable whose significance is being tested using 399
##D # bootstrap replications for each...
##D 
##D npsigtest(bws=bw)
##D 
##D # If you wished, you could conduct the test for, say, variables 1 and 3
##D # only, as in
##D 
##D npsigtest(bws=bw,index=c(1,3))
## End(Not run) 



