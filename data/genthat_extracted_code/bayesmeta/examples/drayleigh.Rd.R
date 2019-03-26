library(bayesmeta)


### Name: drayleigh
### Title: The Rayleigh distribution.
### Aliases: drayleigh prayleigh qrayleigh rrayleigh
### Keywords: distribution

### ** Examples

########################
# illustrate densities:
x <- seq(0,6,le=200)
plot(x, drayleigh(x, scale=0.5), type="l", col="green",
     xlab=expression(tau), ylab=expression("probability density "*f(tau)))
lines(x, drayleigh(x, scale=1/sqrt(2)), col="red")
lines(x, drayleigh(x, scale=1), col="blue")
abline(h=0, v=0, col="grey")

###############################################
# illustrate exponential / Rayleigh connection
# via a quantile-quantile plot (Q-Q-plot):
N <- 10000
exprate <- 5
plot(sort(sqrt(rexp(N, rate=exprate))),
     qrayleigh(ppoints(N), scale=1/sqrt(2*exprate)))
abline(0, 1, col="red")

###############################################
# illustrate Maximum Entropy distributions
# under similar but different constraints:
mu <- 0.5
tau <- seq(0, 4*mu, le=100)
plot(tau, dexp(tau, rate=1/mu), type="l", col="red", ylim=c(0,1/mu),
     xlab=expression(tau), ylab="probability density")
lines(tau, drayleigh(tau, scale=1/sqrt(2*1/mu^2)), col="blue")
abline(h=0, v=0, col="grey")
abline(v=mu, col="darkgrey"); axis(3, at=mu, label=expression(mu))
# explicate constraints:
legend("topright", pch=15, col=c("red","blue"),
       c(expression("Exponential:  E["*tau*"]"==mu),
         expression("Rayleigh:  E["*tau^2*"]"==mu^2)))



