library(ade4)


### Name: mcoa
### Title: Multiple CO-inertia Analysis
### Aliases: mcoa print.mcoa summary.mcoa plot.mcoa
### Keywords: multivariate

### ** Examples

data(friday87)
w1 <- data.frame(scale(friday87$fau, scal = FALSE))
w2 <- ktab.data.frame(w1, friday87$fau.blo, tabnames = friday87$tab.names)
mcoa1 <- mcoa(w2, "lambda1", scan = FALSE)
mcoa1
summary(mcoa1)
plot(mcoa1)



