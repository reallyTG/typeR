library(fptdApprox)


### Name: growth.intervals
### Title: Studying the Growth of a Vector
### Aliases: growth.intervals

### ** Examples

u <- seq(0, 5, length = 200)
v <- sin(u)
w <- growth.intervals(u, v)
w

plot(u, v, type = "l", las = 1)
abline(v = u[as.vector(w)])

## Continuing the FPTL(.) examples:
## Don't show: 
Lognormal <- diffproc(c("m*x","sigma^2*x^2","dnorm((log(x)-(log(y)+(m-sigma^2/2)*(t-s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+(m-sigma^2/2)*(t-s),sigma*sqrt(t-s))")) ; 
b <- "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))" ; y <- FPTL(dp = Lognormal, t0 = 0, T = 18, x0 = 1, S = b, list(m = 0.48, sigma = 0.07))
## End(Don't show)
growth.intervals(y$x, y$y)
growth.intervals(y$x, y$y, zeroSlope = 0.001)



