library(extremis)


### Name: cdensity
### Title: Kernel Smoothed Scedasis Density
### Aliases: cdensity cdensity.default

### ** Examples

data(lse)
attach(lse)
Y <- data.frame(DATE[-1], -diff(log(ROYAL.DUTCH.SHELL.B)))
T <- dim(Y)[1]
k <- floor((0.4258597) * T / (log(T)))
fit <- cdensity(Y, kernel = "biweight", bw = 0.1 / sqrt(7), 
                threshold = sort(Y[, 2])[T - k])
plot(fit)
plot(fit, original = FALSE)



