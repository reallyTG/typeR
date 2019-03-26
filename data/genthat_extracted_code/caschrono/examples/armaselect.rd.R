library(caschrono)


### Name: armaselect
### Title: Minic method
### Aliases: armaselect
### Keywords: ts

### ** Examples

set.seed(4123)
n2 <- 210
yc <- arima.sim(n = 200, list(ar = -0.8, ma = c(-0.3, 0.6)),
 sd = sqrt(1.5))
yc <- yc - 10
armaselect(yc, nbmod = 5) 



