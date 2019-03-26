library(IDSpatialStats)


### Name: est.transdist
### Title: Estimate transmission distance
### Aliases: est.transdist

### ** Examples

set.seed(123)

# Exponentially distributed transmission kernel with mean and standard deviation = 100
dist.func <- alist(n=1, a=1/100, rexp(n, a)) 

# Simulate epidemic
a <- sim.epidemic(R=1.5,
                  gen.t.mean=7,
                  gen.t.sd=2,
                  min.cases=50,
                  tot.generations=12,
                  trans.kern.func=dist.func)

# Estimate mean and standara deviation of transmission kernel
b <- est.transdist(epi.data=a,
                   gen.t.mean=7,
                   gen.t.sd=2,
                   t1=0,
                   max.sep=1e10,
                   max.dist=1e10,
                   n.transtree.reps=10)
b



