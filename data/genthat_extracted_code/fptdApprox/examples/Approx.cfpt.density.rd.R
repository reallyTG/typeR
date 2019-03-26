library(fptdApprox)


### Name: Approx.cfpt.density
### Title: Approximating First-Passage-Time Densities for Conditioned
###   Problems
### Aliases: Approx.cfpt.density
### Keywords: classes list methods print

### ** Examples

## Continuing the summary.fptl(.) example:
## Don't show: 
Lognormal <- diffproc(c("m*x","sigma^2*x^2","dnorm((log(x)-(log(y)+(m-sigma^2/2)*(t-s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+(m-sigma^2/2)*(t-s),sigma*sqrt(t-s))")) ; 
b <- "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))" ; y <- FPTL(dp = Lognormal, t0 = 0, T = 18, x0 = 1, S = b, list(m = 0.48, sigma = 0.07)) ; yy <- summary(y);
LognormalFEx <- diffproc(c("`h(t)`*x", "sigma^2*x^2", "dnorm((log(x)-(log(y)+`H(s,t)`-(sigma^2/2)*(t - s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+ `H(s,t)`-(sigma^2/2)*(t-s),sigma*sqrt(t-s))"));
z <- FPTL(dp = LognormalFEx, t0 = 1, T = 10, x0 = 1, S = 15, env = list(sigma=0.1, `h(t)` = "t/4", `H(s,t)` = "(t^2-s^2)/8")); zz <- summary(z)
## End(Don't show)
## Making an efficient approximation of the f.p.t. density 
## (optimal variable integration steps and small computational cost)
yyy <- Approx.cfpt.density(yy)
yyy

zzz <- Approx.cfpt.density(zz)
zzz

## Making a less efficient approximation of the f.p.t. density 
## (optimal fixed integration step but high computational cost related to 
##  the efficient approximation)
## Not run: 
##D yyy1 <- Approx.cfpt.density(yy, variableStep = FALSE, from.t0 = TRUE, to.T = 
##D                          TRUE, skip = FALSE)
##D yyy1
## End(Not run)



