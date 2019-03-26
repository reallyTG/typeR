library(rpf)


### Name: rpf.lmp
### Title: Create logistic function of a monotonic polynomial (LMP) model
### Aliases: rpf.lmp

### ** Examples

spec <- rpf.lmp(1) # 3rd order polynomial
theta<-seq(-3,3,.1)
p<-rpf.prob(spec, c(-.11,.37,.24,-.21),theta)

spec <- rpf.lmp(2) # 5th order polynomial
p<-rpf.prob(spec, c(.69,.71,-.5,-8.48,.52,-3.32),theta)



