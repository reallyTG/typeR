library(JWileymisc)


### Name: testdistr
### Title: Graphically compare the distribution of a variable against a
###   specific distribution
### Aliases: testdistr
### Keywords: hplot multivariate

### ** Examples


## Not run: 
##D 
##D ## example data
##D set.seed(1234)
##D d <- data.frame(
##D   Ynorm = rnorm(200),
##D   Ybeta = rbeta(200, 1, 4),
##D   Ychisq = rchisq(200, 8),
##D   Yf = rf(200, 5, 10),
##D   Ygamma = rgamma(200, 2, 2),
##D   Ynbinom = rnbinom(200, mu = 4, size = 9),
##D   Ypois = rpois(200, 4))
##D 
##D ## testing and graphing
##D testdistr(d$Ybeta, "beta", starts = list(shape1 = 1, shape2 = 4))
##D testdistr(d$Ychisq, "chisq", starts = list(df = 8))
##D testdistr(d$Yf, "f", starts = list(df1 = 5, df2 = 10))
##D testdistr(d$Ygamma, "gamma")
##D testdistr(d$Ynbinom, "poisson")
##D testdistr(d$Ynbinom, "nbinom")
##D testdistr(d$Ypois, "poisson")
##D 
##D ## compare log likelihood of two different distributions
##D testdistr(d$Ygamma, "normal")$Distribution$LL
##D testdistr(d$Ygamma, "gamma")$Distribution$LL
##D 
##D testdistr(d$Ynorm, "normal")
##D testdistr(c(d$Ynorm, 10, 1000), "normal",
##D   extremevalues = "theoretical")
##D testdistr(c(d$Ynorm, 10, 1000), "normal",
##D   extremevalues = "theoretical", robust = TRUE)
##D 
##D testdistr(mtcars, "mvnormal")
##D 
##D rm(d) ## cleanup
## End(Not run)



