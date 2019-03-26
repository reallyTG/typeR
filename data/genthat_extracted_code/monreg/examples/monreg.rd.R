library(monreg)


### Name: monreg
### Title: Estimating Monotone Regression Functions Nonparametrically
### Aliases: monreg
### Keywords: nonparametric smooth regression

### ** Examples

x <- rnorm(100)
y <- x + rnorm(100)
mon1 <- monreg(x, y, hd = .5, hr = .5)
plot(mon1$t, mon1$estimation)



