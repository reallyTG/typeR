library('mfx')

### Name: poissonmfx
### Title: Marginal effects for a Poisson regression.
### Aliases: poissonmfx print.poissonmfx

### ** Examples

# simulate some data
set.seed(12345)
n = 1000
x = rnorm(n)
y = rnegbin(n, mu = exp(1 + 0.5 * x), theta = 0.5)

data = data.frame(y,x)

poissonmfx(formula=y~x,data=data)
