library(fptdApprox)


### Name: plot.fptl
### Title: Plotting Method for fptl Objects
### Aliases: plot.fptl
### Keywords: methods

### ** Examples

## Continuing the FPTL(.) example:
## Don't show: 
Lognormal <- diffproc(c("m*x","sigma^2*x^2","dnorm((log(x)-(log(y)+(m-sigma^2/2)*(t-s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+(m-sigma^2/2)*(t-s),sigma*sqrt(t-s))")) ; 
b <- "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))" ; y <- FPTL(dp = Lognormal, t0 = 0, T = 18, x0 = 1, S = b, list(m = 0.48, sigma = 0.07)); 
LognormalFEx <- diffproc(c("`h(t)`*x", "sigma^2*x^2", "dnorm((log(x)-(log(y)+`H(s,t)`-(sigma^2/2)*(t - s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+ `H(s,t)`-(sigma^2/2)*(t-s),sigma*sqrt(t-s))"));
z <- FPTL(dp = LognormalFEx, t0 = 1, T = 10, x0 = 1, S = 15, env = list(sigma=0.1, `h(t)` = "t/4", `H(s,t)` = "(t^2-s^2)/8"))
## End(Don't show)
plot(y)
plot(y, cex.main = 1.4, growth.points = FALSE)
plot(y, cex.main = 1.4, growth.points = FALSE, instants = FALSE)
plot(y, cex.main = 1.4, dp.legend = FALSE, growth.points = FALSE, instants = FALSE)
plot(y, cex = 1.25, cex.main = 1.25)
plot(y, cex = 1.25, cex.main = 1.25, dp.legend.cex = 0.8)

plot(z)
plot(z, from.t0 = FALSE)
plot(z, to.T = FALSE)
plot(z, from.t0 = FALSE, to.T = FALSE)



