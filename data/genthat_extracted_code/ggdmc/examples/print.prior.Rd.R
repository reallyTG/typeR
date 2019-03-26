library(ggdmc)


### Name: print.prior
### Title: Print Prior Distribution
### Aliases: print.prior

### ** Examples

pop.mean  <- c(a=1,  v.f1=1,  v.f2=.2, z=.5, sz=.3,  sv.f1=.25, sv.f2=.23,
               t0=.3)
pop.scale <- c(a=.2, v.f1=.2, v.f2=.2, z=.1, sz=.05, sv.f1=.05, sv.f2=.05,
               t0=.05)

p.prior <- BuildPrior(
  dists = rep("tnorm", 8),
  p1    = pop.mean,
  p2    = pop.scale,
  lower = c(0, -5, -5, 0, 0, 0, 0, 0),
  upper = c(2,  5,  5, 1, 2, 2, 1, 1))

print(p.prior)



