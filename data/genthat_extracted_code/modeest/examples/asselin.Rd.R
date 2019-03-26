library(modeest)


### Name: asselin
### Title: The Asselin de Beauville mode estimator
### Aliases: asselin Asselin

### ** Examples

x <- rbeta(1000, shape1 = 2, shape2 = 5)

## True mode:
betaMode(shape1 = 2, shape2 = 5)

## Estimation:
asselin(x, bw = 1)
asselin(x, bw = 1/2)
mlv(x, method = "asselin")




