library(pro)


### Name: pro
### Title: Fit the PRO model
### Aliases: pro

### ** Examples

n <- 500
set.seed(100)
re <- sim.lif(n, rbinom(n, 1, 0.14), 7, 3)
fit.pro <- pro(re$sbin, re$I)
summary(fit.pro)



