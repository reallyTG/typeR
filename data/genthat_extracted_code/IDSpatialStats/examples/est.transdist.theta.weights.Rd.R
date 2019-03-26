library(IDSpatialStats)


### Name: est.transdist.theta.weights
### Title: Estimate transmission distance theta values by replication
### Aliases: est.transdist.theta.weights

### ** Examples

set.seed(1)

gen.t.mean <- 7
gen.t.sd <- 2
t1 <- 0

# Normally distributed transmission kernel with mean and standard deviation = 100
dist.func <- alist(n=1, a=1/100, rexp(n, a)) 

# Simulate epidemic
a <- sim.epidemic(R=5,
                  gen.t.mean=gen.t.mean,
                  gen.t.sd=gen.t.sd,
                  min.cases=5,
                  tot.generations=3,
                  trans.kern.func=dist.func)

# Get case times
a <- a[order(a[,3]),]
case.times <- round(a[,3])
unique.times <- unique(case.times)
ntimes <- length(unique.times)


# Generation time distribution
max.t <- round(max(unique.times) - t1) - 1
n.step <- round(max.t/gen.t.mean)
gen <- rep(0, max.t*2)
for (i in 1:n.step){gen <- gen + dnorm(1:(max.t*2), gen.t.mean*i, gen.t.sd*i)}
gen[1] <- 0 # No instantaneous infections
t.density <- gen/sum(gen)

# Estimation of theta weights matrix
b <- est.transdist.theta.weights(case.times=case.times,
                                 n.rep=3, 
                                 gen.t.mean=gen.t.mean, 
                                 t1=t1, 
                                 t.density=t.density)



