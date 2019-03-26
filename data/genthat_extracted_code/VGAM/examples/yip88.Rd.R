library(VGAM)


### Name: yip88
### Title: Zero-Inflated Poisson Distribution (Yip (1988) algorithm)
### Aliases: yip88
### Keywords: models regression

### ** Examples

phi <- 0.35; lambda <- 2  # Generate some artificial data
y <- rzipois(n <- 1000, lambda, phi)
table(y)

# Two equivalent ways of fitting the same model
fit1 <- vglm(y ~ 1, yip88(n = length(y)), subset = y > 0)
fit2 <- vglm(y ~ 1, yip88, trace = TRUE, crit = "coef")
(true.mean <- (1-phi) * lambda)
mean(y)
head(fitted(fit1))
fit1@misc$pstr0  # The estimate of phi

# Compare the ZIP with the positive Poisson distribution
pp <- vglm(y ~ 1, pospoisson, subset = y > 0, crit = "c")
coef(pp)
Coef(pp)
coef(fit1) - coef(pp)            # Same
head(fitted(fit1) - fitted(pp))  # Different

# Another example (Angers and Biswas, 2003) ---------------------
abdata <- data.frame(y = 0:7, w = c(182, 41, 12, 2, 2, 0, 0, 1))
abdata <- subset(abdata, w > 0)

yy <- with(abdata, rep(y, w))
fit3 <- vglm(yy ~ 1, yip88(n = length(yy)), subset = yy > 0)
fit3@misc$pstr0  # Estimate of phi (they get 0.5154 with SE 0.0707)
coef(fit3, matrix = TRUE)
Coef(fit3)  # Estimate of lambda (they get 0.6997 with SE 0.1520)
head(fitted(fit3))
mean(yy)  # Compare this with fitted(fit3)



