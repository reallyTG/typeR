library(VGAM)


### Name: rec.exp1
### Title: Upper Record Values from a 1-parameter Exponential Distribution
### Aliases: rec.exp1
### Keywords: models regression

### ** Examples

rawy <- rexp(n <- 10000, rate = exp(1))
y <- unique(cummax(rawy))  # Keep only the records

length(y) / y[length(y)]   # MLE of rate

fit <- vglm(y ~ 1, rec.exp1, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)



