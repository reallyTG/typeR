library(tsdf)


### Name: print.opt.design
### Title: print Zhong's design from a "opt.design" object.
### Aliases: print.opt.design

### ** Examples

alpha1 <- 0.20
alpha2 <- 0.1
beta <- 0.20
pc <- 0.5
pt <- pc + 0.2
out <- opt.design(alpha1, alpha2, beta, pc, pt, stage = 2, sf.param = 1)
print(out)



