library(NPCirc)


### Name: bw.CV
### Title: Cross-validation for density estimation
### Aliases: bw.CV
### Keywords: circular density

### ** Examples

set.seed(2012)
n <- 100
x <- rcircmix(n, model=11)
bw.CV(x, method="LCV", lower=0, upper=20)
bw.CV(x, method="LSCV", lower=0, upper=20)



