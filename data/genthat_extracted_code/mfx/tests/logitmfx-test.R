library('mfx')

### Name: logitmfx
### Title: Marginal effects for a logit regression.
### Aliases: logitmfx print.logitmfx

### ** Examples

# simulate some data
set.seed(12345)
n = 1000
x = rnorm(n)

# binary outcome
y = ifelse(pnorm(1 + 0.5*x + rnorm(n))>0.5, 1, 0)

data = data.frame(y,x)
logitmfx(formula=y~x, data=data)
