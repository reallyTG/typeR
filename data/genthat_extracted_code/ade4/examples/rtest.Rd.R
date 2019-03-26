library(ade4)


### Name: rtest
### Title: Class of the Permutation Tests (in R).
### Aliases: rtest
### Keywords: methods

### ** Examples

par(mfrow = c(2, 2))
for (x0 in c(2.4, 3.4, 5.4, 20.4)) {
    l0 <- as.randtest(sim = rnorm(200), obs = x0)
    print(l0)
    plot(l0, main = paste("p.value = ", round(l0$pvalue, dig = 5)))
}
par(mfrow = c(1, 1))



