library(CharFun)


### Name: cfS_StudentT
### Title: Characteristic function of Student's t-distribution
### Aliases: cfS_StudentT

### ** Examples

## EXAMPLE1 (CF of the Student t-distribution with df = 2)
df <- 2
t <- seq(-5, 5, length.out = 501)
plotGraf(function(t)
  cfS_StudentT(t, df), t, title = "CF of the Student t-distribution with df = 2")

## EXAMPLE2 (PDF/CDF of the Student t-distribution with df = 3)
df <- 2
cf <- function(t)
  cfS_StudentT(t, df)
x <- seq(-8, 8, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, SixSigmaRule = 8)



