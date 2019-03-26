library(pro)


### Name: model.pro
### Title: Model matrix for point-process responses
### Aliases: model.pro

### ** Examples

n <- 500
set.seed(100)
re <- sim.lif(n, rbinom(n, 1, 0.14), 7, 3)
d <- model.pro(re$sbin, re$I)
d[1:10, ]



