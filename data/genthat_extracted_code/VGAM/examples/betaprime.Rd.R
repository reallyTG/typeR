library(VGAM)


### Name: betaprime
### Title: The Beta-Prime Distribution
### Aliases: betaprime
### Keywords: models regression

### ** Examples

nn <- 1000
bdata <- data.frame(shape1 = exp(1), shape2 = exp(3))
bdata <- transform(bdata, yb = rbeta(nn, shape1, shape2))
bdata <- transform(bdata, y1 = (1-yb) /    yb,
                          y2 =    yb  / (1-yb),
                          y3 = rgamma(nn, exp(3)) / rgamma(nn, exp(2)))

fit1 <- vglm(y1 ~ 1, betaprime, data = bdata, trace = TRUE)
coef(fit1, matrix = TRUE)

fit2 <- vglm(y2 ~ 1, betaprime, data = bdata, trace = TRUE)
coef(fit2, matrix = TRUE)

fit3 <- vglm(y3 ~ 1, betaprime, data = bdata, trace = TRUE)
coef(fit3, matrix = TRUE)

# Compare the fitted values
with(bdata, mean(y3))
head(fitted(fit3))
Coef(fit3)  # Useful for intercept-only models



