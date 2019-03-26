library(MAMS)


### Name: mams.sim
### Title: Simulating multi-arm multi-stage designs
### Aliases: mams.sim
### Keywords: design

### ** Examples
## No test: 
# Note that some of these examples may take a few minutes to run

# 2-stage design with O'Brien & Fleming efficacy and zero futility boundary with 
# equal sample size per arm and stage. Design can be found using
# mams(K=4, J=2, alpha=0.05, power=0.9, r=1:2, r0=1:2, ushape="obf", lshape="fixed", 
#      lfix=0, p=0.65, p0=0.55)

# under global null hypothesis (using the pv scale)
mams.sim(nsim=10000, nMat=matrix(c(44, 88), nrow=2, ncol=5), u=c(3.068, 2.169),
         l=c(0.000, 2.169), pv=rep(0.5, 4), ptest=1)

# under global null hypothesis (using the deltav scale)
mams.sim(nsim=10000, nMat=matrix(c(44, 88), nrow=2, ncol=5), u=c(3.068, 2.169),
         l=c(0.000, 2.169), pv=NULL, deltav=rep(0, 4), sd=1, ptest=1)

# under LFC
mams.sim(nsim=10000, nMat=matrix(c(44, 88), nrow=2, ncol=5), u=c(3.068, 2.169),
         l=c(0.000, 2.169), pv=c(0.65, 0.55, 0.55, 0.55), ptest=1:2)

# when all treatments doing similarly well
mams.sim(nsim=10000, nMat=matrix(c(44, 88), nrow=2, ncol=5), u=c(3.068, 2.169),
         l=c(0.000, 2.169), pv=c(0.63, 0.62, 0.60, 0.61), ptest=4)
## End(No test)


