library('mfx')

### Name: negbinmfx
### Title: Marginal effects for a negative binomial regression.
### Aliases: negbinmfx print.negbinmfx

### ** Examples

# simulate some data
set.seed(12345)
n = 1000
x = rnorm(n)
y = rnegbin(n, mu = exp(1 + 0.5 * x), theta = 0.5)

data = data.frame(y,x)

negbinmfx(formula=y~x,data=data)
