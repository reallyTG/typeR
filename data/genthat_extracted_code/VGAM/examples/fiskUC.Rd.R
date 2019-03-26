library(VGAM)


### Name: Fisk
### Title: The Fisk Distribution
### Aliases: Fisk dfisk pfisk qfisk rfisk
### Keywords: distribution

### ** Examples

fdata <- data.frame(y = rfisk(n = 1000, shape = exp(1), scale = exp(2)))
fit <- vglm(y ~ 1, fisk(lss = FALSE), data = fdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)



