library(mar1s)


### Name: sim.mar1s
### Title: Simulate from MAR(1)S Process
### Aliases: sim.mar1s predict.mar1s
### Keywords: models multivariate ts

### ** Examples

data(forest.fire, package = "mar1s")
data(nesterov.index, package = "mar1s")

## Univariate
mar1s <- fit.mar1s(forest.fire)

sim.mar1s(mar1s)
sim.mar1s(mar1s, n.sim = 6)
sim.mar1s(mar1s, n.ahead = 3)

predict(mar1s)
predict(mar1s, n.ahead = 10)
predict(mar1s, init.absdata = 100)

t <- seq(1/12, 11/12, 1/6) 
p <- mapply(predict, start.time = t,
            MoreArgs = list(object = mar1s, probs = c(0.05, 0.95)))
plot(exp(mar1s$logseasonal), ylim = c(0, max(p)),
     ylab = "Forest fire")
arrows(t, p[1, ], t, p[2, ],
       code = 3, angle = 90, length = 0.05)

## External regressors
mar1s <- fit.mar1s(forest.fire, nesterov.index[, "mean"])

sim.mar1s(mar1s)
sim.mar1s(mar1s, n.sim = 6)

predict(mar1s)
predict(mar1s, xreg.absdata = 10000)
predict(mar1s, init.absdata = c(100, 1000))



