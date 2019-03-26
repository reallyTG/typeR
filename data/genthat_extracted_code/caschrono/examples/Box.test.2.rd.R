library(caschrono)


### Name: Box.test.2
### Title: 'Portemanteau' tests
### Aliases: Box.test.2
### Keywords: ts

### ** Examples

set.seed(123)
y1 = arima.sim(n = 100, list(ar = -.7), sd = sqrt(4))
a1 = Box.test.2(y1, nlag = c(3, 6, 9, 12), type = "Ljung-Box", decim = 4)



