library(growthrates)


### Name: ode_genlogistic
### Title: Generalized Logistic Growth Model
### Aliases: ode_genlogistic grow_genlogistic

### ** Examples


time <- seq(0, 30, length=200)
parms <- c(mumax=0.5, K=10, alpha=1, beta=1, gamma=1)
y0    <-  c(y=.1)
out   <- ode(y0, time, ode_genlogistic, parms)
plot(out)

out2 <- ode(y0, time, ode_genlogistic, parms = c(mumax=0.2, K=10, alpha=2, beta=1, gamma=1))
out3 <- ode(y0, time, ode_genlogistic, parms = c(mumax=0.2, K=10, alpha=1, beta=2, gamma=1))
out4 <- ode(y0, time, ode_genlogistic, parms = c(mumax=0.2, K=10, alpha=1, beta=1, gamma=2))
out5 <- ode(y0, time, ode_genlogistic, parms = c(mumax=0.2, K=10, alpha=.5, beta=1, gamma=1))
out6 <- ode(y0, time, ode_genlogistic, parms = c(mumax=0.2, K=10, alpha=1, beta=.5, gamma=1))
out7 <- ode(y0, time, ode_genlogistic, parms = c(mumax=0.3, K=10, alpha=1, beta=1, gamma=.5))
plot(out, out2, out3, out4, out5, out6, out7)

## growth with lag (cf. log_y)
plot(ode(y0, time, ode_genlogistic, parms = c(mumax=1, K=10, alpha=2, beta=.8, gamma=5)))





