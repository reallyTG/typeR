library(pcnetmeta)


### Name: nma.ab.cont
### Title: Arm-Based Network Meta-Analysis for Continuous Outcomes
### Aliases: nma.ab.cont

### ** Examples

data(parkinson)
# increase n.iter to reach convergence of MCMC
# increase n.adapt to enhance efficiency
set.seed(1234)
cont.out <- nma.ab.cont(s.id, t.id, mean, sd, n, data = parkinson,
  param = c("mu", "diff"), model = "hom_eqcor", prior.type = "unif",
  n.adapt = 200, n.iter = 100, n.chains = 1)



