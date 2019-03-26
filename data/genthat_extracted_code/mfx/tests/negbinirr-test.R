library('mfx')

### Name: negbinirr
### Title: Incidence rate ratios for a negative binomial regression.
### Aliases: negbinirr print.negbinirr

### ** Examples

# simulate some data
set.seed(12345)
n = 1000
x = rnorm(n)
y = rnegbin(n, mu = exp(1 + 0.5 * x), theta = 0.5)

data = data.frame(y,x)

negbinirr(formula=y~x,data=data)
