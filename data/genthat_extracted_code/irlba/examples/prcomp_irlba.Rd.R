library(irlba)


### Name: prcomp_irlba
### Title: Principal Components Analysis
### Aliases: prcomp_irlba

### ** Examples

set.seed(1)
x  <- matrix(rnorm(200), nrow=20)
p1 <- prcomp_irlba(x, n=3)
summary(p1)

# Compare with
p2 <- prcomp(x, tol=0.7)
summary(p2)





