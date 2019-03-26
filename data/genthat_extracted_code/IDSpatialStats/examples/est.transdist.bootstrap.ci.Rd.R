library(IDSpatialStats)


### Name: est.transdist.bootstrap.ci
### Title: Bootstrap mean transmission distance values
### Aliases: est.transdist.bootstrap.ci

### ** Examples

set.seed(1)

# Exponentially distributed transmission kernel with mean and standard deviation = 100
dist.func <- alist(n=1, a=1/100, rexp(n, a)) 

# Simulate epidemic
a <- sim.epidemic(R=2.5,
                  gen.t.mean=7,
                  gen.t.sd=2,
                  min.cases=20,
                  tot.generations=5,
                  trans.kern.func=dist.func)

# Estimate mean transmission kernel and its bootstrapped confidence intervals
b <- est.transdist.bootstrap.ci(epi.data=a,
                                gen.t.mean=7,
                                gen.t.sd=2,
                                t1=0,
                                max.sep=1e10,
                                max.dist=1e10,
                                n.transtree.reps=10,
                                mean.equals.sd=TRUE,
                                boot.iter=10,
                                ci.low=0.025,
                                ci.high=0.975,
                                parallel=FALSE)




