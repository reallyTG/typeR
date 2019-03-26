library(OPDOE)


### Name: triangular.test.norm
### Title: Triangular Test for Normal Data
### Aliases: triangular.test.norm
### Keywords: test

### ** Examples

data(heights)
attach(heights)
# a symmetric two sided alternative:
tt <- triangular.test.norm(x=female[1:3],
   y=male[1:3], mu1=170,mu2=176,mu0=164,
   alpha=0.05, beta=0.2,sigma=7)
# Test is yet unfinished, add the remaining values step by step:
tt <- update(tt,x=female[4])
tt <- update(tt,y=male[4])
tt <- update(tt,x=female[5])
tt <- update(tt,y=male[5])
tt <- update(tt,x=female[6])
tt <- update(tt,y=male[6])
tt <- update(tt,x=female[7])
tt <- update(tt,y=male[7])
# Test is finished now
# an unsymmetric two sided alternative:
tt2 <- triangular.test.norm(x=female[1:3],
   y=male[1:3], mu1=170,mu2=180,mu0=162,
   alpha=0.05, beta=0.2,sigma=7)
tt2 <- update(tt2,x=female[4])



