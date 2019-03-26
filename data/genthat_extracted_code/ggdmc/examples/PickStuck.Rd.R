library(ggdmc)


### Name: PickStuck
### Title: Which chains get stuck
### Aliases: PickStuck

### ** Examples

model <- BuildModel(
p.map     = list(A = "1", B = "1", t0 = "1", mean_v = "M", sd_v = "1", st0 = "1"),
match.map = list(M = list(s1 = 1, s2 = 2)),
factors   = list(S = c("s1", "s2")),
constants = c(st0 = 0, sd_v = 1),
responses = c("r1", "r2"),
type      = "norm")
p.vector <- c(A = .75, B = .25, t0 = .2, mean_v.true = 2.5, mean_v.false = 1.5)

p.prior <- BuildPrior(
  dists = c("tnorm", "tnorm", "beta", "tnorm", "tnorm"),
  p1    = c(A = .3, B = .3, t0 = 1, mean_v.true = 1, mean_v.false = 0),
  p2    = c(1, 1,   1, 3, 3),
  lower = c(0,  0,  0, NA, NA),
  upper = c(NA,NA,  1, NA, NA))

## Not run: 
##D dat <- simulate(model, 30, ps = p.vector)
##D dmi <- BuildDMI(dat, model)
##D sam <- run(StartNewsamples(dmi, p.prior))
##D bad <- PickStuck(sam)
## End(Not run)



