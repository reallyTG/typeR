library(numbers)


### Name: primroot
### Title: Primitive Root
### Aliases: primroot

### ** Examples

P <- Primes(100)
R <- c()
for (p in P) {
    R <- c(R, primroot(p))
}
cbind(P, R)  # 7 is the biggest prime root here (for p=71)



