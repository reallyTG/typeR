library('mfx')

### Name: betamfx
### Title: Marginal effects for a beta regression.
### Aliases: betamfx print.betamfx

### ** Examples

# simulate some data
set.seed(12345)
n = 1000
x = rnorm(n)

# beta outcome
y = rbeta(n, shape1 = plogis(1 + 0.5 * x), shape2 = (abs(0.2*x)))
# use Smithson and Verkuilen correction
y = (y*(n-1)+0.5)/n

data = data.frame(y,x)
betamfx(y~x|x, data=data)
