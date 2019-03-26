library(swfscMisc)


### Name: pVal
### Title: Permutation Test P-value
### Aliases: pVal

### ** Examples

null.dist <- rnorm(1000)
obs <- rnorm(1, mean = 1)

plot(density(null.dist), xlim = range(c(obs, null.dist)), main = "")
abline(v = obs)
print(obs)
pVal(obs, null.dist)




