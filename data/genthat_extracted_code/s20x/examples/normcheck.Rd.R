library(s20x)


### Name: normcheck
### Title: Testing for normality plot
### Aliases: normcheck normcheck.default normcheck.lm
### Keywords: hplot

### ** Examples


# An exponential growth curve
e = rnorm(100, 0, 0.1)
x = rnorm(100)
y = exp(5 + 3 * x + e)
fit = lm(y ~ x)
normcheck(fit)

# An exponential growth curve with the correct transformation
fit = lm(log(y) ~ x)
normcheck(fit)

# Same example as above except we use normcheck.default
normcheck(residuals(fit))

# Peruvian Indians data
data(peru.df)
normcheck(lm(BP ~ weight, data = peru.df))




