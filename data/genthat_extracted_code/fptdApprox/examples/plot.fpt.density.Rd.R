library(fptdApprox)


### Name: plot.fpt.density
### Title: Plotting Method for fpt.density Objects
### Aliases: plot.fpt.density
### Keywords: methods

### ** Examples

## Don't show: 
Lognormal <- diffproc(c("m*x","sigma^2*x^2","dnorm((log(x)-(log(y)+(m-sigma^2/2)*(t-s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+(m-sigma^2/2)*(t-s),sigma*sqrt(t-s))")) ; 
b <- "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))" ; y <- FPTL(dp = Lognormal, t0 = 0, T = 18, x0 = 1, S = b, list(m = 0.48, sigma = 0.07)) ; yy <- summary(y);
yyy <- Approx.cfpt.density(yy); yyy.cp <- Approx.fpt.density(dp = Lognormal, t0 = 0, T = 18, id = 1, S = "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))", env = list(m = 0.48, sigma = 0.07))
## End(Don't show)
## Continuing the Approx.cfpt.density(.) example:
plot(yyy)
plot(yyy, from.t0 = TRUE)
plot(yyy, growth.points = TRUE)
plot(yyy, growth.points = TRUE, instants = TRUE)
plot(yyy, dp.legend = FALSE, growth.points = TRUE, instants = TRUE)
plot(yyy, cex = 1.25, cex.main = 1.15)
plot(yyy, cex = 1.25, cex.main = 1.15, dp.legend.cex = 0.8, growth.points = TRUE, instants = TRUE)

## Continuing the Approx.fpt.density example:
plot(yyy.cp)
## Not run: 
##D plot(yyy.ucp)
## End(Not run)




