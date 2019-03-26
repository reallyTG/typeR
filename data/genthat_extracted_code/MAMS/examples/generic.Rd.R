library(MAMS)


### Name: plot
### Title: Different generic functions for class MAMS.
### Aliases: plot.MAMS print.MAMS summary.MAMS print.MAMS.sim
###   summary.MAMS.sim print.MAMS.stepdown summary.MAMS.stepdown
###   plot.MAMS.stepdown
### Keywords: classes

### ** Examples
## No test: 
# 2-stage design with triangular boundaries
res <- mams(K=4, J=2, alpha=0.05, power=0.9, r=1:2, r0=1:2, p=0.65, p0=0.55, 
            ushape="triangular", lshape="triangular", nstart=30)

print(res)
summary(res)
plot(res)

res <- mams.sim(nsim=10000, nMat=matrix(c(44, 88), nrow=2, ncol=5), u=c(3.068, 2.169),
                l=c(0.000, 2.169), pv=c(0.65, 0.55, 0.55, 0.55), ptest=c(1:2, 4))

print(res)

# 2-stage 3-treatments versus control design, all promising treatments are selected:
res <- stepdown.mams(nMat=matrix(c(10, 20), nrow=2, ncol=4), 
                     alpha.star=c(0.01, 0.05), lb=0, 
                     selection="all.promising")

print(res)
summary(res)
plot(res)
## End(No test)


