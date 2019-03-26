library(longpower)


### Name: diggle.linear.power
### Title: Sample size calculations for difference in slopes between two
###   groups.
### Aliases: diggle.linear.power
### Keywords: effects mixed power random sample size

### ** Examples


## Not run: 
##D browseVignettes(package = "longpower")
## End(Not run)

# Reproduces the table on page 29 of Diggle et al
n = 3
t = c(0,2,5)
rho = c(0.2, 0.5, 0.8)
sigma2 = c(100, 200, 300)
tab = outer(rho, sigma2, 
      Vectorize(function(rho, sigma2){
        ceiling(diggle.linear.power(
          delta=0.5,
          t=t,
          sigma2=sigma2,
          R=rho,
          alternative="one.sided",
          power = 0.80)$n)}))
colnames(tab) = paste("sigma2 =", sigma2)
rownames(tab) = paste("rho =", rho)
tab

# An Alzheimer's Disease example using ADAS-cog pilot estimates
# var of random intercept
sig2.i = 55
# var of random slope
sig2.s = 24
# residual var
sig2.e = 10
# covariance of slope and intercep
cov.s.i <- 0.8*sqrt(sig2.i)*sqrt(sig2.s)

cov.t <- function(t1, t2, sig2.i, sig2.s, cov.s.i){
        sig2.i + t1*t2*sig2.s + (t1+t2)*cov.s.i 
}

t = seq(0,1.5,0.25)
n = length(t)
R = outer(t, t, function(x,y){cov.t(x,y, sig2.i, sig2.s, cov.s.i)})
R = R + diag(sig2.e, n, n)

diggle.linear.power(d=1.5, t=t, R=R, sig.level=0.05, power=0.80)




