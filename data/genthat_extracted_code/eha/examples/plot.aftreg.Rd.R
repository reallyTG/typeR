library(eha)


### Name: plot.aftreg
### Title: Plots output from an AFT regression
### Aliases: plot.aftreg
### Keywords: dplot survival

### ** Examples


y <- rllogis(40, shape = 1, scale = 1)
x <- rep(c(1,1,2,2), 10)
fit <- aftreg(Surv(y, rep(1, 40)) ~ x, dist = "loglogistic")
plot(fit)




