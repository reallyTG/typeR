library(SimCorMultRes)


### Name: rbin
### Title: Simulating Correlated Binary Responses Conditional on a Marginal
###   Model Specification
### Aliases: rbin

### ** Examples

## See Example 3.4 in the Vignette.
set.seed(123)
N <- 5000
clsize <- 4
intercepts <- 0
betas <- 0.2
cor.matrix <- toeplitz(c(1, 0.9, 0.9, 0.9))
x <- rep(rnorm(N), each = clsize)
CorBinRes <- rbin(clsize = clsize, intercepts = intercepts, betas = betas,
    xformula = ~x, cor.matrix = cor.matrix, link = 'probit')
library(gee)
binGEEmod <- gee(y ~ x, family = binomial('probit'), id = id, data = CorBinRes$simdata)
summary(binGEEmod)$coefficients

## See Example 3.5 in the Vignette.
set.seed(8)
library(evd)
rlatent1 <- rmvevd(N, dep = sqrt(1 - 0.9), model = 'log', d = clsize)
rlatent2 <- rmvevd(N, dep = sqrt(1 - 0.9), model = 'log', d = clsize)
rlatent <- rlatent1 - rlatent2
CorBinRes <- rbin(clsize = clsize, intercepts = intercepts, betas = betas,
    xformula = ~x, rlatent = rlatent)
binGEEmod <- gee(y ~ x, family = binomial('logit'), id = id, data = CorBinRes$simdata)
summary(binGEEmod)$coefficients




