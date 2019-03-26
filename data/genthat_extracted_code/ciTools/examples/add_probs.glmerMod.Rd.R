library(ciTools)


### Name: add_probs.glmerMod
### Title: Response Probabilities for Generalized Linear Mixed Model
###   Predictions
### Aliases: add_probs.glmerMod

### ** Examples

n <- 300
x <- runif(n)
f <- factor(sample(1:5, size = n, replace = TRUE))
y <- rpois(n, lambda = exp(1 - 0.05 * x * as.numeric(f) + 2 * as.numeric(f)))
tb <- tibble::tibble(x = x, f = f, y = y)
fit <- lme4::glmer(y ~ (1+x|f), data=tb, family = "poisson")

add_probs(tb, fit, name = "p0.6", q = 0.6, nSims = 500)




