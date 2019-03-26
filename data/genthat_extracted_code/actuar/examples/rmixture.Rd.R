library(actuar)


### Name: rmixture
### Title: Simulation from Discrete Mixtures
### Aliases: rmixture
### Keywords: datagen

### ** Examples

## Mixture of two exponentials (with means 1/3 and 1/7) with equal
## probability.
rmixture(10, 0.5, expression(rexp(3), rexp(7)))
rmixture(10, 42, expression(rexp(3), rexp(7))) # same

## Mixture of two lognormals with different probabilities.
rmixture(10, probs = c(0.554, 0.446),
         models = expression(rlnorm(3.575, 0.637),
                             rlnorm(4.555, 0.265)))



