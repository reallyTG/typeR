library(statip)


### Name: densityfun
### Title: Kernel density estimation
### Aliases: densityfun

### ** Examples

x <- rlnorm(1000, 1, 1)
f <- densityfun(x, from = 0)
curve(f(x), xlim = c(0, 20))




