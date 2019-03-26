library('mfx')

### Name: betaor
### Title: Odds ratios for a beta regression.
### Aliases: betaor print.betaor

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
betaor(y~x|x, data=data)
