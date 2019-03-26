library(selectiveInference)


### Name: groupfs
### Title: Select a model with forward stepwise.
### Aliases: groupfs

### ** Examples

x = matrix(rnorm(20*40), nrow=20)
index = sort(rep(1:20, 2))
y = rnorm(20) + 2 * x[,1] - x[,4]
fit = groupfs(x, y, index, maxsteps = 5)
pvals = groupfsInf(fit)



