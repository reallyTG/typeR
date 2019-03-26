library(emplik)


### Name: el.cen.EM2
### Title: Empirical likelihood ratio test for a vector of means with
###   right, left or doubly censored data, by EM algorithm
### Aliases: el.cen.EM2
### Keywords: nonparametric survival htest

### ** Examples

## censored regression with one right censored observation.
## we check the estimation equation, with the MLE inside myfun7. 
y <- c(3, 5.3, 6.4, 9.1, 14.1, 15.4, 18.1, 15.3, 14, 5.8, 7.3, 14.4)
x <- c(1, 1.5, 2,   3,   4,    5,    6,    5,    4,  1,   2,   4.5)
d <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0)
### first we estimate beta, the MLE
lm.wfit(x=cbind(rep(1,12),x), y=y, w=WKM(x=y, d=d)$jump[rank(y)])$coef
## you should get 1.392885 and 2.845658
## then define myfun7 with the MLE value
myfun7 <- function(y, xmat) {
temp1 <- y - ( 1.392885 +  2.845658 * xmat)
return( cbind( temp1, xmat*temp1) )
}
## now test 
el.cen.EM2(y,d, fun=myfun7, mu=c(0,0), xmat=x)
## we should get, Pval = 1 , as the MLE should.
## for other values of (a, b) inside myfun7, you get other Pval
##
rqfun1 <- function(y, xmat, beta, tau = 0.5) {
temp1 <- tau - (1-myfun55(y-beta*xmat))
return(xmat * temp1)
}
myfun55 <- function(x, eps=0.001){
u <- x*sqrt(5)/eps
INDE <- (u < sqrt(5)) & (u > -sqrt(5))
u[u >= sqrt(5)] <- 0
u[u <= -sqrt(5)] <- 1
y <- 0.5 - (u - (u)^3/15)*3/(4*sqrt(5))
u[ INDE ] <- y[ INDE ]
return(u)
}
## myfun55 is a smoothed indicator fn. 
## eps should be between (1/sqrt(n), 1/n^0.75) [Chen and Hall]
el.cen.EM2(x=y,d=d,xc=1:12,fun=rqfun1,mu=0,xmat=x,beta=3.08,tau=0.44769875)
## default tau=0.5 
el.cen.EM2(x=y,d=d,xc=1:12,fun=rqfun1,mu=0,xmat=x,beta=3.0799107404)
###################################################
### next 2 examples are testing the mean/median residual time
###################################################
mygfun <- function(s, age, muage) {as.numeric(s >= age)*(s-(age+muage))}
mygfun2 <- function(s, age, Mdage) 
          {as.numeric(s <= (age+Mdage)) - 0.5*as.numeric(s <= age)}
## Not run: 
##D library(survival) 
##D time <- cancer$time
##D status <- cancer$status-1
##D ###for mean residual time 
##D el.cen.EM2(x=time, d=status, fun=mygfun, mu=0, age=365.25, muage=234)$Pval
##D el.cen.EM2(x=time, d=status, fun=mygfun, mu=0, age=365.25, muage=323)$Pval
##D ### for median resudual time
##D el.cen.EM2(x=time, d=status, fun=mygfun2, mu=0.5, age=365.25, Mdage=184)$Pval
##D el.cen.EM2(x=time, d=status, fun=mygfun2, mu=0.5, age=365.25, Mdage=321)$Pval
## End(Not run)
## Not run: 
##D #### For right censor only data (Kaplan-Meier) we can use this function to get a faster computation
##D #### by calling the kmc 0.2-2 package.
##D el.cen.R <- function (x, d, xc = 1:length(x), fun, mu, error = 1e-09, ...)
##D {
##D xvec <- as.vector(x)
##D d <- as.vector(d)
##D mu <- as.vector(mu)
##D xc <- as.vector(xc)
##D n <- length(d)
##D if (length(xvec) != n)
##D stop("length of d and x must agree")
##D if (length(xc) != n)
##D stop("length of xc and d must agree")
##D if (n <= 2 * length(mu) + 1)
##D stop("Need more observations")
##D if (any((d != 0) & (d != 1) ))
##D stop("d must be 0(right-censored) or 1(uncensored)")
##D if (!is.numeric(xvec))
##D stop("x must be numeric")
##D if (!is.numeric(mu))
##D stop("mu must be numeric")
##D 
##D funx <- as.matrix(fun(xvec, ...))
##D pp <- ncol(funx)
##D if (length(mu) != pp)
##D stop("length of mu and ncol of fun(x) must agree")
##D temp <- Wdataclean5(z = xvec, d, zc = xc, xmat = funx)
##D x <- temp$value
##D d <- temp$dd
##D w <- temp$weight
##D funx <- temp$xxmat
##D d[length(d)] <- 1
##D xd1 <- x[d == 1]
##D if (length(xd1) <= 1)
##D stop("need more distinct uncensored obs.")
##D funxd1 <- funx[d == 1, ]
##D xd0 <- x[d == 0]
##D wd1 <- w[d == 1]
##D wd0 <- w[d == 0]
##D m <- length(xd0)
##D 
##D pnew <- NA
##D num <- NA
##D if (m > 0) {
##D gfun <- function(x) { return( fun(x, ...) - mu ) }
##D temp <- kmc.solve(x=x, d=d, g=list(gfun))
##D logel <- temp$loglik.h0
##D logel00 <- temp$loglik.null
##D lam <- - temp$lambda
##D }
##D if (m == 0) {
##D num <- 0
##D temp6 <- el.test.wt2(x = funxd1, wt = wd1, mu)
##D pnew <- temp6$prob
##D lam <- temp6$lambda
##D logel <- sum(wd1 * log(pnew))
##D logel00 <- sum(wd1 * log(wd1/sum(wd1)))
##D }
##D tval <- 2 * (logel00 - logel)
##D list(loglik = logel, times = xd1, prob = pnew, lam = lam,
##D iters = num, `-2LLR` = tval, Pval = 1 - pchisq(tval,
##D df = length(mu)))
##D }
##D 
## End(Not run)



