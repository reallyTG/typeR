library(strucchange)


### Name: catL2BB
### Title: Generators for efpFunctionals along Categorical Variables
### Aliases: catL2BB ordL2BB ordwmax
### Keywords: regression

### ** Examples

## artificial data
set.seed(1)
d <- data.frame(
  x = runif(200, -1, 1),
  z = factor(rep(1:4, each = 50)),
  err = rnorm(200)
)
d$y <- rep(c(0.5, -0.5), c(150, 50)) * d$x + d$err

## empirical fluctuation process
scus <- gefp(y ~ x, data = d, fit = lm, order.by = ~ z)

## chi-squared-type test (unordered LM-type test)
LMuo <- catL2BB(scus)
plot(scus, functional = LMuo)
sctest(scus, functional = LMuo)

## ordinal maxLM test (with few replications only to save time)
maxLMo <- ordL2BB(scus, nrep = 10000)
plot(scus, functional = maxLMo)
sctest(scus, functional = maxLMo)

## ordinal weighted double maximum test
WDM <- ordwmax(scus)
plot(scus, functional = WDM)
sctest(scus, functional = WDM)



