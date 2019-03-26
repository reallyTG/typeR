library(eha)


### Name: plot.phreg
### Title: Plots output from a phreg regression
### Aliases: plot.phreg
### Keywords: dplot survival

### ** Examples


y <- rllogis(40, shape = 1, scale = 1)
x <- rep(c(1,1,2,2), 10)
fit <- phreg(Surv(y, rep(1, 40)) ~ x, dist = "loglogistic")
plot(fit)




