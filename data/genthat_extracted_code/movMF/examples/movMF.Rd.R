library(movMF)


### Name: movMF
### Title: Fit Mixtures of von Mises-Fisher Distributions
### Aliases: movMF

### ** Examples

## Generate and fit a "small-mix" data set a la Banerjee et al.
mu <- rbind(c(-0.251, -0.968),
            c(0.399, 0.917))
kappa <- c(4, 4)
theta <- kappa * mu
theta
alpha <- c(0.48, 0.52)
## Generate a sample of size n = 50 from the von Mises-Fisher mixture
## with the above parameters.
set.seed(123)
x <- rmovMF(50, theta, alpha)
## Fit a von Mises-Fisher mixture with the "right" number of components,
## using 10 EM runs.
set.seed(123)
y2 <- movMF(x, 2, nruns = 10)
## Inspect the fitted parameters:
y2
## Compare the fitted classes to the true ones:
table(True = attr(x, "z"), Fitted = predict(y2))
## To use a common kappa:
y2cv <- movMF(x, 2, nruns = 10, kappa = list(common = TRUE))
## To use a common kappa fixed to the true value of 4:
y2cf <- movMF(x, 2, nruns = 10, kappa = 4)
## Comparing solutions via BIC:
sapply(list(y2, y2cf, y2cv), BIC)
##  Use a different kappa solver:
set.seed(123)
y2a <- movMF(x, 2, nruns = 10, kappa = "uniroot")
y2a



