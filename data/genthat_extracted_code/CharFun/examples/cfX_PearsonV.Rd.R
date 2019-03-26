library(CharFun)


### Name: cfX_PearsonV
### Title: Characteristic function of Pearson type V distribution
### Aliases: cfX_PearsonV

### ** Examples

## EXAMPLE1 ((CF of the PearsonV distribution)
alpha <- 3 / 2
beta <- 2 / 3
t <- seq(-10, 10, length.out = 1001)
plotGraf(function(t)
  cfX_PearsonV(t, alpha, beta), t,
  title = "CF of the PearsonV distribution with alpha = 3/2, beta = 2/3")

## EXAMPLE2 (PDF/CDF of the Beta distribution with alpha = 3/2, beta = 2/3)
alpha <- 3 / 2
beta <- 2 / 3
prob <- c(0.9, 0.95, 0.99)
x <- seq(0, 40, length.out = 101)
cf <- function(t)
  cfX_PearsonV(t, alpha, beta)
result <-
  cf2DistGP(cf,
            x,
            prob,
            xMin = 0,
            N = 2 ^ 10,
            SixSigmaRule = 10)

## EXAMPLE3 (PDF/CDF of the compound Binomial-PearsonV distribution)
n <- 25
p <- 0.3
alpha <- 3 / 2
beta <- 2 / 3
prob <- c(0.9, 0.95, 0.99)
x <- seq(0, 200, length.out = 101)
cfX <- function(t)
  cfX_PearsonV(t, alpha, beta)
cf <- function(t)
  cfN_Binomial(t, n, p, cfX)

result <- cf2DistGP(cf, x, prob, isCompound = TRUE, N = 2 ^ 10)



