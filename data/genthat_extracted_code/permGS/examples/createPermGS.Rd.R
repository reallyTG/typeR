library(permGS)


### Name: createPermGS
### Title: createPermGS
### Aliases: createPermGS

### ** Examples

## standard permutation test (no imputation, free permutations)
x <- createPermGS(1000, FALSE, "none")
summary(x)
## imputation using IPT method, restricted permutations
y <- createPermGS(1000, TRUE, "IPT")
summary(y)



