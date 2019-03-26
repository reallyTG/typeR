library(lmomco)


### Name: qua2ci.cov
### Title: Estimate a Confidence Interval for Quantiles of a Parent
###   Distribution using Sample Variance-Covariances of L-moments
### Aliases: qua2ci.cov
### Keywords: quantile function (confidence limit)

### ** Examples

## Not run: 
##D samsize <- 128; nsim <- 2000; f <- 0.999
##D wei <- parwei(vec2lmom(c(100,75,-.3)))
##D set.seed(1734); X <- rlmomco(samsize, wei); set.seed(1734)
##D tmp <- qua2ci.cov(X, f, type="wei", nsim=nsim)
##D print(tmp) # show results of one 2000 replicated Monte Carlo
##D # nonexceed     lwr    fit    upr  qua_med  qua_mean  qua_var  qua_lam2
##D #     0.999   310.4  333.2  360.2    333.6     334.3    227.3    8.4988
##D set.seed(1734)
##D qf <- qua2ci.cov(X, f, type="wei", nsim=nsim, interval="none") # another
##D boxplot(qf)
##D message(" quantile variance: ", round(tmp$qua_var,  digits=2),
##D         " compared to ", round(var(qf, na.rm=TRUE), digits=2))
##D set.seed(1734)
##D genci.simple(wei, n=samsize, f=f)
##D # nonexceed     lwr    fit    upr  qua_med  qua_mean  qua_var  qua_lam2
##D #     0.999   289.7  312.0  337.7    313.5     313.6    213.5    8.2330
##D 
##D #----------------------------------------
##D # Using X from above example, demonstrate that using dimensionless
##D # simulation that the results are the same.
##D set.seed(145); qua2ci.cov(X, 0.1, type="wei") # both outputs same
##D set.seed(145); qua2ci.cov(X, 0.1, type="wei", dimless=TRUE)
##D # nonexceed     lwr    fit    upr  qua_med  qua_mean  qua_var  qua_lam2
##D #       0.1  -78.62 -46.01 -11.39   -43.58    -44.38   416.04     11.54
##D 
##D #----------------------------------------
##D # Using X again, demonstration application of the flip and notice that just
##D # simple reversal is occurring and that the Weibull is a reversed GEV.
##D eta <- 0
##D set.seed(145); qua2ci.cov(X, 0.9, type="wei", nsim=nsim)
##D # nonexceed     lwr    fit    upr  qua_med  qua_mean  qua_var  qua_lam2
##D #       0.9   232.2  244.2  255.9    244.3     244.1    51.91    4.0635
##D set.seed(145); qua2ci.cov(X, 0.9, type="gev", nsim=nsim, flip=eta)
##D # nonexceed     lwr    fit    upr  qua_med  qua_mean  qua_var  qua_lam2
##D #       0.9   232.2  244.2  256.2    244.2     244.3    53.02    4.1088
##D # The values are slightly different, which likely represents a combination
##D # of numerics of the variance-covariance matrix because the Monte Carlo
##D # is seeded the same.
##D 
##D #----------------------------------------
##D # Using X again, removed dimension and have the function add it back.
##D lmr <- lmoms(X); Y <- (X - lmr$lambdas[1])/lmr$lambdas[2]
##D set.seed(145); qua2ci.cov(Y, 0.9, type="wei", altlmoms=lmr, nsim=nsim)
##D # nonexceed     lwr    fit    upr  qua_med  qua_mean  qua_var  qua_lam2
##D #       0.9   232.2  244.2  255.9    244.3     244.1    51.91   4.0635
## End(Not run)



