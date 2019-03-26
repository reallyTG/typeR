library(modeest)


### Name: tsybakov
### Title: The Tsybakov mode estimator
### Aliases: tsybakov Tsybakov

### ** Examples

x <- rbeta(1000, shape1 = 2, shape2 = 5)

## True mode:
betaMode(shape1 = 2, shape2 = 5)

## Estimation:
tsybakov(x, kernel = "triangular")
tsybakov(x, kernel = "gaussian", alpha = 0.99)
mlv(x, method = "tsybakov", kernel = "gaussian", alpha = 0.99)




