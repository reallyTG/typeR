library(fptdApprox)


### Name: summary.fptl
### Title: Locating a Conditioned First-Passage-Time Variable
### Aliases: summary.fptl is.summary.fptl print.summary.fptl
### Keywords: classes array methods print

### ** Examples

## Continuing the FPTL(.) example:
## Don't show: 
Lognormal <- diffproc(c("m*x","sigma^2*x^2","dnorm((log(x)-(log(y)+(m-sigma^2/2)*(t-s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+(m-sigma^2/2)*(t-s),sigma*sqrt(t-s))")) ;
b <- "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))" ; y <- FPTL(dp = Lognormal, t0 = 0, T = 18, x0 = 1, S = b, list(m = 0.48, sigma = 0.07));
LognormalFEx <- diffproc(c("`h(t)`*x", "sigma^2*x^2", "dnorm((log(x)-(log(y)+`H(s,t)`-(sigma^2/2)*(t - s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+ `H(s,t)`-(sigma^2/2)*(t-s),sigma*sqrt(t-s))"));
z <- FPTL(dp = LognormalFEx, t0 = 1, T = 10, x0 = 1, S = 15, env = list(sigma=0.1, `h(t)` = "t/4", `H(s,t)` = "(t^2-s^2)/8"))
## End(Don't show)
## Summarizing an object of class fptl
yy <- summary(y)
yy
print(yy, digits=10)
yy1 <- summary(y, zeroSlope = 0.001)
yy1
yy2 <- summary(y, zeroSlope = 0.001, p0.tol = 10)
yy2

zz <- summary(z)
zz

## Testing summary.fptl objects
is.summary.fptl(yy)
is.summary.fptl(zz)



