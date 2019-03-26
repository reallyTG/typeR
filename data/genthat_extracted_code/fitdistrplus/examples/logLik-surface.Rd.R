library(fitdistrplus)


### Name: logLiksurface
### Title: (Log)likelihood surfaces or (log)likelihood curves
### Aliases: llsurface llcurve
### Keywords: distribution

### ** Examples

# (1) loglikelihood or likelihood curve
#

n <- 100
set.seed(1234)
x <- rexp(n)

llcurve(data = x, distr = "exp", plot.arg =  "rate", min.arg = 0, max.arg = 4)

llcurve(data = x, distr = "exp", plot.arg =  "rate", min.arg = 0, max.arg = 4, 
loglik = FALSE)

llcurve(data = x, distr = "exp", plot.arg =  "rate", min.arg = 0, max.arg = 4, 
  main = "log-likelihood for exponential distribution", col = "red")
abline(v = 1, lty = 2)


# (2) loglikelihood surface
# 

x <- rnorm(n, 0, 1)

llsurface(data =x, distr="norm", plot.arg=c("mean", "sd"), 
          min.arg=c(-1, 0.5), max.arg=c(1, 3/2), back.col = FALSE,
          main="log-likelihood for normal distribution")
llsurface(data =x, distr="norm", plot.arg=c("mean", "sd"), 
          min.arg=c(-1, 0.5), max.arg=c(1, 3/2), 
          main="log-likelihood for normal distribution", 
          nlev = 20, pal.col = heat.colors(100),)
points(0, 1, pch="+", col="red")
llsurface(data =x, distr="norm", plot.arg=c("mean", "sd"), 
          min.arg=c(-1, 0.5), max.arg=c(1, 3/2), 
          main="log-likelihood for normal distribution", 
          nlev = 0, back.col = TRUE, pal.col = rainbow(100, s = 0.5, end = 0.8))
points(0, 1, pch="+", col="black")





