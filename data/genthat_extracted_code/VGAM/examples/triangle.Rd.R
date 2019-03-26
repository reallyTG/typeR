library(VGAM)


### Name: triangle
### Title: Triangle Distribution Family Function
### Aliases: triangle
### Keywords: models regression

### ** Examples

# Example 1
tdata <- data.frame(y = rtriangle(n <- 3000, theta = 3/4))
fit <- vglm(y ~ 1, triangle(link = "identitylink"), data = tdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
head(fit@extra$lower)
head(fitted(fit))
with(tdata, mean(y))

# Example 2; Kotz and van Dorp (2004), p.14
rdata <- data.frame(y = c(0.1, 0.25, 0.3, 0.4, 0.45, 0.6, 0.75, 0.8))
fit <- vglm(y ~ 1, triangle(link = "identitylink"), data = rdata, trace = TRUE,
            crit = "coef", maxit = 1000)
Coef(fit)  # The MLE is the 3rd order statistic, which is 0.3.
fit <- vglm(y ~ 1, triangle(link = "identitylink"), data = rdata, trace = TRUE,
            crit = "coef", maxit = 1001)
Coef(fit)  # The MLE is the 3rd order statistic, which is 0.3.



