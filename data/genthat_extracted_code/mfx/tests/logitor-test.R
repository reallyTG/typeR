library('mfx')

### Name: logitor
### Title: Odds ratios for a logit regression.
### Aliases: logitor print.logitor

### ** Examples

# simulate some data
set.seed(12345)
n = 1000
x = rnorm(n)

# binary outcome
y = ifelse(pnorm(1 + 0.5*x + rnorm(n))>0.5, 1, 0)

data = data.frame(y,x)
logitor(formula=y~x, data=data)
