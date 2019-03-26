library(ggdmc)


### Name: theta2mcmclist
### Title: Convert theta to a mcmc List
### Aliases: theta2mcmclist phi2mcmclist

### ** Examples

## Not run: 
##D model <- BuildModel(
##D p.map     = list(a = "RACE", v = c("S", "RACE"), z = "RACE", d = "1",
##D             sz = "1", sv = "1", t0 = c("S", "RACE"), st0 = "1"),
##D match.map = list(M = list(gun = "shoot", non = "not")),
##D factors   = list(S = c("gun", "non"), RACE = c("black", "white")),
##D constants = c(st0 = 0, d = 0, sz = 0, sv = 0),
##D responses = c("shoot", "not"),
##D type      = "rd")
##D 
##D pnames <- GetPNames(model)
##D npar   <- length(pnames)
##D pop.mean  <- c(1, 1, 2.5, 2.5, 2.5, 2.5, .50, .50, .4, .4, .4, .4)
##D pop.scale <- c(.15, .15, 1, 1, 1, 1, .05, .05, .05, .05, .05, .05)
##D names(pop.mean)  <- pnames
##D names(pop.scale) <- pnames
##D pop.prior <- BuildPrior(
##D   dists = rep("tnorm", npar),
##D   p1    = pop.mean,
##D   p2    = pop.scale,
##D   lower = c(rep(0, 2), rep(-5, 4), rep(0, 6)),
##D   upper = c(rep(5, 2), rep(7, 4), rep(2, 6)))
##D p.prior <- BuildPrior(
##D   dists = rep("tnorm", npar),
##D   p1    = pop.mean,
##D   p2    = pop.scale*10,
##D   lower = c(rep(0, 2), rep(-5, 4), rep(0, 6)),
##D   upper = c(rep(10, 2), rep(NA, 4), rep(5, 6)))
##D mu.prior <- BuildPrior(
##D   dists = rep("tnorm", npar),
##D   p1    = pop.mean,
##D   p2    = pop.scale*10,
##D   lower = c(rep(0,  2), rep(-5, 4), rep(0, 6)),
##D   upper = c(rep(10, 2), rep(NA, 4), rep(5, 6)))
##D sigma.prior <- BuildPrior(
##D   dists = rep("beta", npar),
##D   p1    = rep(1, npar),
##D   p2    = rep(1, npar),
##D   upper = rep(2, npar))
##D names(sigma.prior) <- GetPNames(model)
##D priors <- list(pprior=p.prior, location=mu.prior, scale=sigma.prior)
##D dat    <- simulate(model, nsim = 10, nsub = 10, prior = pop.prior)
##D dmi    <- BuildDMI(dat, model)
##D ps     <- attr(dat, "parameters")
##D 
##D fit0 <- StartNewsamples(dmi, priors)
##D fit  <- run(fit0)
##D 
##D tmp1 <- theta2mcmclist(fit[[1]])
##D tmp2 <- theta2mcmclist(fit[[2]], start = 10, end = 90)
##D tmp3 <- theta2mcmclist(fit[[3]], split = TRUE)
##D tmp4 <- theta2mcmclist(fit[[4]], subchain = TRUE)
##D tmp5 <- theta2mcmclist(fit[[5]], subchain = TRUE, nsubchain = 4)
##D tmp6 <- theta2mcmclist(fit[[6]], thin = 2)
## End(Not run)




