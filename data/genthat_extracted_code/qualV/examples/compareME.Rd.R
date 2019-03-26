library(qualV)


### Name: compareME
### Title: Compute Several Deviance Measures for Comparison
### Aliases: compareME print.compareME summary.compareME
### Keywords: misc

### ** Examples

# a constructed example
x <- seq(0, 2*pi, 0.1)
y <- 5 + sin(x)             # a process
o <- y + rnorm(x, sd = 0.2) # observation with random error
p <- y + 0.1                # simulation with systematic bias

os <- ksmooth(x, o, kernel = "normal",
  bandwidth = dpill(x, o), x.points = x)$y
plot(x, o); lines(x, p); lines(x, os, col = "red")

compareME(o, p)
compareME(os, p)

# observed and measured data with non-matching time intervals
data(phyto)
compareME(obs$y, sim$y, obs$t, sim$t, time = "fixed")
tt <- timeTransME(obs$y, sim$y, obs$t, sim$t, ME = SMSLE, trials = 5)
compareME(tt$yo, tt$yp)

# show names of deviance measures
compareME(type = "name")



