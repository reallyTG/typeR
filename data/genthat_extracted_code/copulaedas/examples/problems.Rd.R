library(copulaedas)


### Name: problems
### Title: Benchmark Problems
### Aliases: fAckley fGriewank fRastrigin fRosenbrock fSphere
###   fSummationCancellation

### ** Examples

all.equal(fAckley(rep(0, 10)), 0)
all.equal(fGriewank(rep(0, 10)), 0)
all.equal(fRastrigin(rep(0, 10)), 0)
all.equal(fRosenbrock(rep(1, 10)), 0)
all.equal(fSphere(rep(0, 10)), 0)
all.equal(fSummationCancellation(rep(0, 10)), -1e+05)



