library(sklarsomega)


### Name: residuals.sklarsomega
### Title: Extract model residuals.
### Aliases: residuals.sklarsomega

### ** Examples

# Fit a subset of the cartilage data, assuming a Laplace marginal distribution.

data(cartilage)
data = as.matrix(cartilage)[1:100, ]
colnames(data) = c("c.1.1", "c.2.1")
fit = sklars.omega(data, level = "interval", control = list(dist = "laplace"))
summary(fit)
res = residuals(fit)
qqnorm(res, pch = 20)
abline(0, 1, col = "red", lwd = 2)



