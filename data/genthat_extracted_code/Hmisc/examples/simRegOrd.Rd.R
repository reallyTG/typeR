library(Hmisc)


### Name: simRegOrd
### Title: Simulate Power for Adjusted Ordinal Regression Two-Sample Test
### Aliases: simRegOrd
### Keywords: htest category

### ** Examples

## Not run: 
##D ## First use no ordinal high-end category overrides, and compare power
##D ## to t-test when there is no covariate
##D 
##D n <- 100
##D delta <- .5
##D sd <- 1
##D require(pwr)
##D power.t.test(n = n / 2, delta=delta, sd=sd, type='two.sample')  # 0.70
##D set.seed(1)
##D w <- simRegOrd(n, delta=delta, sigma=sd, pr=TRUE)     # 0.686
##D 
##D ## Now do ANCOVA with a quadratic effect of a covariate
##D n <- 100
##D x <- rnorm(n)
##D w <- simRegOrd(n, nsim=400, delta=delta, sigma=sd, x=x,
##D                X=cbind(x, x^2),
##D                Eyx=function(x) x + x^2, pr=TRUE)
##D w$power  # 0.68
##D 
##D ## Fit a cubic spline to some simulated pilot data and use the fitted
##D ## function as the true equation in the power simulation
##D require(rms)
##D N <- 1000
##D set.seed(2)
##D x <- rnorm(N)
##D y <- x + x^2 + rnorm(N, 0, sd=sd)
##D f <- ols(y ~ rcs(x, 4), x=TRUE)
##D 
##D n <- 100
##D j <- sample(1 : N, n, replace=n > N)
##D x <-   x[j]
##D X <- f$x[j,]
##D w <- simRegOrd(n, nsim=400, delta=delta, sigma=sd, x=x,
##D                X=X,
##D                Eyx=Function(f), pr=TRUE)
##D w$power  ## 0.70
##D 
##D ## Finally, add discrete ordinal category overrides and high end of y
##D ## Start with no effect of treatment on these ordinal event levels (OR=1.0)
##D 
##D w <- simRegOrd(n, nsim=400, delta=delta, odds.ratio=1, sigma=sd,
##D                x=x, X=X, Eyx=Function(f),
##D                p=c(.98, .01, .01),
##D                pr=TRUE)
##D w$power  ## 0.61   (0.3 if p=.8 .1 .1, 0.37 for .9 .05 .05, 0.50 for .95 .025 .025)
##D 
##D ## Now assume that odds ratio for treatment is 2.5
##D ## First compute power for clinical endpoint portion of Y alone
##D or <- 2.5
##D p <- c(.9, .05, .05)
##D popower(p, odds.ratio=or, n=100)   # 0.275
##D ## Compute power of t-test on continuous part of Y alone
##D power.t.test(n = 100 / 2, delta=delta, sd=sd, type='two.sample')  # 0.70
##D ## Note this is the same as the p.o. model power from simulation above
##D ## Solve for OR that gives the same power estimate from popower
##D popower(rep(.01, 100), odds.ratio=2.4, n=100)   # 0.706
##D ## Compute power for continuous Y with ordinal override
##D w <- simRegOrd(n, nsim=400, delta=delta, odds.ratio=or, sigma=sd,
##D                x=x, X=X, Eyx=Function(f),
##D                p=c(.9, .05, .05),
##D                pr=TRUE)
##D w$power  ## 0.72
## End(Not run)



