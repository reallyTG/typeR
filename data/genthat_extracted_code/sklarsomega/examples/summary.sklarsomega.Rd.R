library(sklarsomega)


### Name: summary.sklarsomega
### Title: Print a summary of a Sklar's Omega fit.
### Aliases: summary.sklarsomega

### ** Examples

# Fit a subset of the cartilage data, assuming a Laplace marginal distribution. Compute
# confidence intervals in the usual ML way (observed information matrix).

data(cartilage)
data = as.matrix(cartilage)[1:100, ]
colnames(data) = c("c.1.1", "c.2.1")
fit = sklars.omega(data, level = "interval", confint = "asymptotic",
                   control = list(dist = "laplace"))
summary(fit)
vcov(fit)



