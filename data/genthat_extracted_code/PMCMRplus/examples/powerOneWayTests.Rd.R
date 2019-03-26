library(PMCMRplus)


### Name: powerOneWayTests
### Title: Power Simulation for One-Factorial Single Hypothesis Tests
### Aliases: powerOneWayTests
### Keywords: misc

### ** Examples

## Not run: 
##D set.seed(12)
##D mu <- c(0, 0, 1, 2)
##D n <- c(5, 4, 5, 5)
##D parms <- list(mean=0, sd=1)
##D powerOneWayTests(mu, n, parms, test = "cuzickTest",
##D alternative = "two.sided", replicates = 1E4)
##D 
##D ## Compare power estimation for
##D ## one-way ANOVA with balanced design
##D ## as given by functions
##D ## power.anova.test, pwr.anova.test
##D ## and powerOneWayTest
##D 
##D groupmeans <- c(120, 130, 140, 150)
##D SEsq <- 500  # within-variance
##D n <- 10
##D k <- length(groupmeans)
##D df <- n * k - k
##D SSQ.E <- SEsq * df
##D SSQ.A <- n * var(groupmeans) * (k - 1)
##D sd.errfn <- sqrt(SSQ.E / (n * k - 1))
##D R2 <- c("R-squared" = SSQ.A / (SSQ.A + SSQ.E))
##D cohensf <- sqrt(R2 / (1 - R2))
##D names(cohensf) <- "Cohens f"
##D 
##D ## R stats power function 
##D power.anova.test(groups = k,
##D                  between.var = var(groupmeans),
##D                  within.var = SEsq,
##D                  n = n)
##D 
##D ## pwr power function
##D pwr.anova.test(k = k, n = n, f = cohensf, sig.level=0.05)
##D 
##D ## this Monte-Carlo based estimation  
##D set.seed(200)
##D powerOneWayTests(mu = groupmeans,
##D                  n = n,
##D                  parms = list(mean=0, sd=sd.errfn),
##D                  test = "oneway.test",
##D                  var.equal = TRUE,
##D                  replicates = 5E3)
##D 
##D ## Compare with effect sizes
##D R2
##D cohensf
##D 
## End(Not run)




