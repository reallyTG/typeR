library(extremis)


### Name: cmodes
### Title: Mode Mass Function
### Aliases: cmodes cmodes.default

### ** Examples

data(lse)
attach(lse)
nlr <- -apply(log(lse[, -1]), 2, diff)
Y <- data.frame(DATE[-1], nlr)
T <- dim(Y)[1]
k <- floor((0.4258597) * T / (log(T)))
fit <- cmodes(Y, thresholds = as.numeric(apply(nlr, 2, sort)[T - k, ]),  
              kernel = "biweight", bw = 0.1 / sqrt(7), nu = 100)
plot(fit)



