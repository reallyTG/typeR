library(vows)


### Name: summary.lm.mp
### Title: Summarizing massively parallel linear model fits
### Aliases: summary.lm.mp

### ** Examples


Y = matrix(rnorm(6000), nrow=20)
X = rnorm(20)
t1 = lm.mp(Y, ~X)
st1 = summary(t1)



