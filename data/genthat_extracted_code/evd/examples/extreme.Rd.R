library(evd)


### Name: extreme
### Title: Distributions of Maxima and Minima
### Aliases: dextreme pextreme qextreme rextreme
### Keywords: distribution

### ** Examples

dextreme(2:4, dnorm, pnorm, mean = 0.5, sd = 1.2, mlen = 5)
dextreme(2:4, distn = "norm", mean = 0.5, sd = 1.2, mlen = 5)
dextreme(2:4, distn = "exp", mlen = 2, largest = FALSE)
pextreme(2:4, distn = "exp", rate = 1.2, mlen = 2)
qextreme(seq(0.9, 0.6, -0.1), distn = "exp", rate = 1.2, mlen = 2)
rextreme(5, qgamma, shape = 1, mlen = 10)
p <- (1:9)/10
pexp(qextreme(p, distn = "exp", rate = 1.2, mlen = 1), rate = 1.2)
## [1] 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9



