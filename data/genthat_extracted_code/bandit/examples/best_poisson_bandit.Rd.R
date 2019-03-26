library(bandit)


### Name: best_poisson_bandit
### Title: best_poisson_bandit
### Aliases: best_poisson_bandit bpb
### Keywords: htest design

### ** Examples

p1 = rpois(100, lambda=10)
p2 = rpois(100, lambda=9)
x = sapply(list(p1, p2), sum)
n = sapply(list(p1, p2), length)
best_poisson_bandit(x,n)



