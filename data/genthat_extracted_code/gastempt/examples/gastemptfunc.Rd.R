library(gastempt)


### Name: gastemptfunc
### Title: Functions for gastric emptying analysis
### Aliases: gastemptfunc linexp linexp_slope linexp_auc powexp
###   powexp_slope linexp_log powexp_log

### ** Examples

t = seq(0,100, by=5)
kappa = 1.3
tempt = 60
v0 = 400
beta = 3
pars = c(v0 = v0, tempt = tempt, kappa = kappa)
par(mfrow=c(1,3))
plot(t, linexp(t, v0, tempt, kappa), type = "l", ylab = "volume",
   main = "linexp\nkappa = 1.3 and 1.0")
lines(t, linexp(t, v0, tempt, 1), type = "l", col = "green")
# This should give the same plot as above
plot(t, linexp(t, pars = pars), type = "l", ylab = "volume",
   main = "linexp\nkappa = 1.3 and 1.0\nwith vectored parameters")
lines(t, linexp(t, v0, tempt, 1), type = "l", col = "green")
plot(t, powexp(t, v0, tempt, beta), type = "l", ylab = "volume",
  main = "powexp\nbeta = 2 and 1")
lines(t, powexp(t, v0, tempt, 1), type = "l", col = "green")



