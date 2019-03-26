library(mixR)


### Name: plot.bootEM
### Title: Plot Bootstrap Likelihood Ratio Test
### Aliases: plot.bootEM

### ** Examples

## plotting the bootstrap LRT result
set.seed(100)
x <- rmixnormal(200, c(0.5, 0.5), c(2, 5), c(1, 0.7))
ret <- bs.test(x, ncomp = c(2, 3), B = 30)
plot(ret)




