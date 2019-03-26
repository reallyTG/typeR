library(IDSpatialStats)


### Name: sim.epidemic
### Title: Simulation of an epidemic in space and time
### Aliases: sim.epidemic

### ** Examples

set.seed(1)

dist.func <- alist(n=1, a=1/100, rexp(n, a)) # Exponential transmission kernel with mean = sd = 100

# Simulate epidemic with constant R value
a <- sim.epidemic(R=1.5,
                  gen.t.mean=7,
                  gen.t.sd=2,
                  tot.generations=15,
                  min.cases=100,
                  trans.kern.func=dist.func)

sim.plot(a)

# Simulate an epidemic with variable R value
r1 <- 2
r2 <- 0.25
tg <- 25
R.vec <- seq(r1, r2, (r2 -r1)/(tg - 1))

b <- sim.epidemic(R=R.vec,
                  gen.t.mean=7,
                  gen.t.sd=2,
                  tot.generations=tg,
                  min.cases=100,
                  trans.kern.func=dist.func)

sim.plot(b)



