library(lava.tobit)


### Name: plotres
### Title: Plot distribution of standardized residuals
### Aliases: plotres
### Keywords: models

### ** Examples


## Not run: 
##D 
##D ## Simulate data where (y01,y2)
##D ## follows conditional bivariate normal distribution
##D ## given covariate x. Instead of y01 we observe
##D ## right censored version y2
##D n <- 200
##D m <- lvm(c(y01,y2) ~ x)
##D covariance(m) <- y01~y2
##D set.seed(1)
##D d <- sim(m,n)
##D d$cens1 <- rexp(n)
##D d$status1 <- with(d,y01<cens1)
##D d$y1 <- with(d, pmin(y01,cens1))
##D 
##D ## Estimate model parameters
##D d$S1 <- with(d, Surv(y1,status1))
##D m <- lvm(c(S1,y2)~x); covariance(m) <- S1~y2
##D e <- estimate(m,d,control=list(trace=1))
##D 
##D ## Plot cumulative distribution functions
##D par(mfrow=c(2,2)); plotres(e); plot(e)
## End(Not run)




