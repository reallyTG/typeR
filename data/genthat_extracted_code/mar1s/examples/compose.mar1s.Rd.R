library(mar1s)


### Name: compose.mar1s
### Title: Compose and Decompose MAR(1)S Process
### Aliases: compose.mar1s decompose.mar1s
### Keywords: models multivariate ts

### ** Examples

data(forest.fire, package = "mar1s")
data(nesterov.index, package = "mar1s")

## Simple
mar1s <- fit.mar1s(window(forest.fire, 1969, 1989))

x <- ts(rnorm(365, sd = mar1s$logresid.sd), start = c(1989, 1))
plot(compose.mar1s(mar1s, x)$absdata)

decomp <- decompose.mar1s(mar1s, mar1s$decomposed$absdata)
delta <- abs(nan2na(mar1s$decomposed$logresid) -
             nan2na(decomp$logresid))
stopifnot(all(na.exclude(tail(delta, -1)) < 1E-6))

## External regressors
mar1s <- fit.mar1s(window(forest.fire, 1969, 1989),
                   window(nesterov.index[, "mean"], 1969, 1989))

x <- rnorm(365, sd = mar1s$logresid.sd)
xreg <- window(nesterov.index[, "mean"], 1989.001, 1990)
plot(compose.mar1s(mar1s, x, c(1989, 1), xreg)$absdata)

decomp <- decompose.mar1s(mar1s, mar1s$decomposed$absdata)
delta <- abs(mar1s$decomposed$logstoch - decomp$logstoch)
stopifnot(all(na.exclude(delta) < 1E-6))
delta <- abs(nan2na(mar1s$decomposed$logresid) -
             nan2na(decomp$logresid))
stopifnot(all(na.exclude(tail(delta, -1)) < 1E-6))



