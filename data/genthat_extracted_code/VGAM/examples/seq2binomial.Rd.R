library(VGAM)


### Name: seq2binomial
### Title: The Two-stage Sequential Binomial Distribution Family Function
### Aliases: seq2binomial
### Keywords: models regression

### ** Examples

sdata <- data.frame(mvector = round(rnorm(nn <- 100, m = 10, sd = 2)),
                    x2 = runif(nn))
sdata <- transform(sdata, prob1 = logit(+2 - x2, inverse = TRUE),
                          prob2 = logit(-2 + x2, inverse = TRUE))
sdata <- transform(sdata, successes1 = rbinom(nn, size = mvector,    prob = prob1))
sdata <- transform(sdata, successes2 = rbinom(nn, size = successes1, prob = prob2))
sdata <- transform(sdata, y1 = successes1 / mvector)
sdata <- transform(sdata, y2 = successes2 / successes1)
fit <- vglm(cbind(y1, y2) ~ x2, seq2binomial, weight = mvector,
            data = sdata, trace = TRUE)
coef(fit)
coef(fit, matrix = TRUE)
head(fitted(fit))
head(depvar(fit))
head(weights(fit, type = "prior"))  # Same as with(sdata, mvector)
# Number of first successes:
head(depvar(fit)[, 1] * c(weights(fit, type = "prior")))
# Number of second successes:
head(depvar(fit)[, 2] * c(weights(fit, type = "prior")) *
                          depvar(fit)[, 1])



