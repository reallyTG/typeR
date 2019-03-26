library(qgam)


### Name: check.learn
### Title: Visual checks for the output of tuneLearn()
### Aliases: check.learn

### ** Examples

library(qgam)
set.seed(525)
dat <- gamSim(1, n=200)
b <- tuneLearn(lsig = seq(-0.5, 1, length.out = 10), 
               y~s(x0)+s(x1)+s(x2)+s(x3), 
               data=dat, qu = 0.5)
check(b) 




