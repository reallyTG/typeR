library(lmomco)


### Name: tau34sq.normtest
### Title: The Tau34-squared Test: A Normality Test based on L-skew and
###   L-kurtosis and an Elliptical Rejection Region on an L-moment Ratio
###   Diagram
### Aliases: tau34sq.normtest
### Keywords: L-moment (hypothesis)

### ** Examples

HarriCoble <- tau34sq.normtest(rnorm(20), verbose=TRUE)
## Not run: 
##D # If this basic algorithm is run repeatedly with different arguments,
##D # then the first three rows of table 1 in Harri and Coble (2011) can
##D # basically be repeated. Testing by WHA indicates that even better
##D # empirical alphas will be computed compared to those reported in that table 1.
##D # R --vanilla --silent --args n 20 s 100 < t34.R
##D # Below is file t34.R
##D library(batch) # for command line argument parsing
##D a <- 0.05; n <- 50; s <- 5E5 # defaults
##D parseCommandArgs() # it will echo out those arguments on command line
##D sims <- sapply(1:s, function(i) {
##D           return(tau34sq.normtest(rnorm(n),
##D                  pvalue.only=TRUE)) })
##D p <- length(sims[sims <= a])
##D print("RESULTS(Alpha, SampleSize, EmpiricalAlpha)")
##D print(c(a, n, p/s))
## End(Not run)



