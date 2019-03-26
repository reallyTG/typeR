library(ggdmc)


### Name: plot_prior
### Title: Plot prior distributions
### Aliases: plot_prior plot.prior

### ** Examples

p.prior <- BuildPrior(
           dists = rep("tnorm", 7),
           p1    = c(a = 2,   v.f1 = 4,  v.f2 = 3,  z = 0.5, sv = 1,
                     sz = 0.3, t0 = 0.3),
           p2    = c(a = 0.5, v.f1 = .5, v.f2 = .5, z = 0.1, sv = .3,
                     sz = 0.1, t0 = 0.05),
           lower = c(0,-5, -5, 0, 0, 0, 0),
           upper = c(5, 7,  7, 1, 2, 1, 1))

plot_prior("a", p.prior)
plot_prior(2, p.prior)
plot(p.prior)



