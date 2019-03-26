library(VGAM)


### Name: rdiric
### Title: The Dirichlet distribution
### Aliases: rdiric
### Keywords: distribution

### ** Examples

ddata <- data.frame(rdiric(n = 1000, shape = c(y1 = 3, y2 = 1, y3 = 4)))
fit <- vglm(cbind(y1, y2, y3) ~ 1, dirichlet, data = ddata, trace = TRUE)
Coef(fit)
coef(fit, matrix = TRUE)



