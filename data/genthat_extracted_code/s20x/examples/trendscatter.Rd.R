library(s20x)


### Name: trendscatter
### Title: Trend and scatter plot
### Aliases: trendscatter trendscatter.default trendscatter.formula
### Keywords: hplot

### ** Examples


# A simple polynomial
x = rnorm(100)
e = rnorm(100)
y = 2 + 3 * x - 2 * x^2 + 4 * x^3 + e
trendscatter(y ~ x)

# An exponential growth curve
e = rnorm(100, 0, 0.1)
y = exp(5 + 3 * x + e)
trendscatter(log(y) ~ x)

# Peruvian Indians data
data(peru.df)
trendscatter(BP ~ weight, data = peru.df)

# Note: this usage is deprecated
with(peru.df,trendscatter(weight,BP))




