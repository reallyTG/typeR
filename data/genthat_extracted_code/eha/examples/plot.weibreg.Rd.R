library(eha)


### Name: plot.weibreg
### Title: Plots output from a Weibull regression
### Aliases: plot.weibreg
### Keywords: dplot survival

### ** Examples


y <- rweibull(4, shape = 1, scale = 1)
x <- c(1,1,2,2)
fit <- weibreg(Surv(y, c(1,1,1,1)) ~ x)
plot(fit)




